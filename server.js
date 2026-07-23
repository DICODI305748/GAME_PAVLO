// Zombie Survival 3D — co-op relay server (Node.js + ws)
// Run:  npm install  &&  npm start
// The server just relays messages between players in the same room.
// The first player in a room becomes the HOST (owns the zombie simulation).

const { WebSocketServer } = require("ws");
const PORT = process.env.PORT || 8080;

const wss = new WebSocketServer({ port: PORT });
const rooms = new Map(); // roomId -> Set<ws>
let nextId = 1;

function broadcast(room, msg, except) {
  const set = rooms.get(room);
  if (!set) return;
  const s = JSON.stringify(msg);
  for (const c of set) if (c !== except && c.readyState === 1) c.send(s);
}

wss.on("connection", (ws) => {
  ws.id = nextId++;
  ws.room = null;
  ws.isHost = false;

  ws.on("message", (data) => {
    let msg;
    try { msg = JSON.parse(data); } catch { return; }

    if (msg.t === "join") {
      ws.room = String(msg.room || "1");
      if (!rooms.has(ws.room)) rooms.set(ws.room, new Set());
      const set = rooms.get(ws.room);
      set.add(ws);
      ws.isHost = set.size === 1;
      ws.send(JSON.stringify({ t: "welcome", id: ws.id, host: ws.isHost, count: set.size }));
      // tell existing peers someone joined
      broadcast(ws.room, { t: "peerjoin", id: ws.id }, ws);
      console.log(`player ${ws.id} joined room "${ws.room}" (${set.size} in room, host=${ws.isHost})`);
      return;
    }

    if (!ws.room) return;
    // relay everything else to the rest of the room, tagged with sender id
    msg.from = ws.id;
    broadcast(ws.room, msg, ws);
  });

  ws.on("close", () => {
    if (!ws.room || !rooms.has(ws.room)) return;
    const set = rooms.get(ws.room);
    set.delete(ws);
    broadcast(ws.room, { t: "peerleave", id: ws.id });
    // promote a new host if the host left
    if (ws.isHost && set.size > 0) {
      const nh = [...set][0];
      nh.isHost = true;
      nh.send(JSON.stringify({ t: "host" }));
    }
    if (set.size === 0) rooms.delete(ws.room);
    console.log(`player ${ws.id} left room "${ws.room}"`);
  });
});

console.log(`🧟 Zombie co-op relay listening on ws://0.0.0.0:${PORT}`);
