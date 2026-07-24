# 🧟 Zombie Survival 3D

A **3D first-person zombie survival** game in a single HTML file, built with [Three.js](https://threejs.org). Explore a **procedurally generated** world (forests, mountains, a shop, a ТЦК and randomized landmarks), gather **wood 🪵, stone 🪨 and metal 🔩**, and build a fortified base with Fortnite-style pieces. **Every 5 minutes night falls** and a horde of zombies swarms in from the edges — and they **smash through your walls**. Each night there are more of them and they hit harder. Upgrade your walls **wood → stone → metal**, plant **torches and spikes**, mount **turrets**, and survive as many nights as you can.

## 🌐 Online co-op (optional)

Play with friends on a shared map. You need the tiny relay server running.

**Easiest (no terminal):** double-click **`СТАРТ.bat`** (Windows) or **`СТАРТ-mac-linux.command`** (Mac/Linux). It checks for Node.js, installs the dependency on first run, and starts the server for you. Keep the window open while you play.

**Or manually:**

```bash
npm install     # installs `ws`
npm start        # starts the co-op server on ws://localhost:8080
```

Then open the game and press **🌐 Кооператив** on the start screen. A server is identified by a **name + password**:

- **➕ Зробити сервер** — type a **server name** and a **password**, click **Зробити сервер**, then press the green **Грати** button. While you're in the game your server is live and findable.
- **🔍 Знайти сервер** — a friend types the **same name and password**, clicks **🔍 Шукати**. The game pings the relay: if that server is up it joins straight in, otherwise it says it wasn't found (check the name/password, or ask the host to press Play).

The name+password pair hashes to a shared room that also **seeds the world**, so everyone on the same server gets the **same procedurally generated map**, sees each other move, **builds a base together**, and fights the **same zombie horde** (the first player in is the host and owns the zombie simulation).

- To play over the internet, open **⚙ Адреса сервера** and paste your public `wss://` address — **both players must use the same one**. Locally leave `ws://localhost:8080`.
- Sharing the auto-generated link (🔗) lets a friend join without typing anything — it carries the room + server (the password is baked into the room hash, so the link works without revealing it).
- The offline single-player game still works exactly as before if you don't create/join a server.

### Playing over the internet

`localhost` only works on one machine. To play with friends elsewhere, make the server reachable from the internet and give the client a **`wss://`** URL (a page served over HTTPS can only connect to secure `wss://`):

1. **Easiest — a tunnel from your PC.** Run the server (`npm start`), then in another terminal:
   - Cloudflare: `cloudflared tunnel --url http://localhost:8080` → gives an `https://…trycloudflare.com` URL; use it as `wss://…trycloudflare.com`.
   - or `npx localtunnel --port 8080`, or `ngrok http 8080`.
2. **Free cloud host (permanent).** Deploy `server.js` to Render / Railway / Fly.io (it already listens on `process.env.PORT`). You get a `wss://your-app.onrender.com` URL.
3. Host the game page itself somewhere friends can open it (GitHub Pages / Netlify — it's just `index.html` + `three.min.js`), open the **🌐 Кооператив** panel, paste your `wss://` address into **server address**, click **Створити гру**, and send the generated link (it carries the room code **and** the server address).

## 🌙 Day / night survival loop

- **Day (5 min the first time, then shorter):** loot chests, chop trees for wood, mine rocks for stone, and build/upgrade your base. No zombies.
- **Night:** a wave of zombies spawns from the map edges and marches on you, attacking any wall in the way until it breaks. Survive the night and dawn burns away the stragglers.
- **Each night** the wave is bigger, tougher and faster. How many nights can you last?

## 🧱 Base building & upgrades

Build mode (**B**) pieces, all on a Fortnite-style grid: **1** wall · **2** door · **3** window · **4** floor · **5** ladder · **6** turret · **7** torch 🔥 (light) · **8** spikes 🔩 (trap that shreds zombies) · **9** crafting table 🔨. Aim at a piece and press **U** to upgrade it a tier — **wood → stone → metal** — spending stone then metal for far more health.

## 🔨 Crafting weapons

You start with **only a pickaxe and axe — no guns**, and weapons no longer drop from chests. To arm up you must build a **crafting table**: first lay a floor and upgrade it to **metal**, then place the table (slot **9**) *on that metal floor* — it costs **70 🪵 + 90 🪨 + 40 🔩**. Stand next to it and press **E** to open the bench and craft any weapon (pistol, SMG, AR, shotgun, sniper, bazooka) for wood/stone/metal.

## ▶️ Play

Open `index.html` in any modern browser (needs internet the first time — Three.js loads from a CDN).

Local server:

```bash
python3 -m http.server 8000
# visit http://localhost:8000
```

Click the canvas to lock the mouse. Press **Esc** to release it.

## 🎮 Controls

| Input | Action |
|-------|--------|
| **WASD** | Move · **Shift** sprint · **Space** jump |
| **Mouse** | Look · **LMB** shoot / place build piece |
| **B** | Toggle **Combat / Build** mode |
| **1–7** | Combat: 1-5 guns, 6 pickaxe, 7 axe · Build: 1 wall, 2 door, 3 window, 4 floor, 5 ladder, 6 turret |
| **U** | In build mode: upgrade the wooden piece you're aiming at to stone (costs 🪨) |
| **F** | Enter / exit a **car** |
| **Mouse wheel** | Cycle weapons |
| **R** | Reload |
| **E** | Open a chest · harvest trees/rocks with pickaxe/axe for materials |
| **M** | Toggle the background music on / off |

## 🚗 Vehicles, turrets & harvesting tools

- **Drivable cars & a ТЦК van** — walk up to any vehicle and press **F** to get in. Drive with WASD (accelerate, reverse, steer), and run over enemies at speed. Press **F** again to get out.
- **Auto-turret** — in Build mode, select slot **4** to place a turret for **30 materials**. It automatically targets and fires at nearby enemies with line-of-sight, and has its own health.
- **Pickaxe & axe** (slots **6** and **7**) — melee tools that harvest materials. Hit **rocks** with the pickaxe and **trees** with the axe (right tool = bonus materials), or use them as close-range weapons.

## 🔫 Weapons

Five weapons, each with its own damage, fire rate, spread, magazine and range:

- **Pistol** — reliable starter, semi-auto
- **SMG** — fast full-auto, high spread
- **Assault Rifle** — balanced full-auto workhorse
- **Shotgun** — 9 pellets, devastating up close
- **Sniper** — one-shot potential, scopes in when you aim

Headshots deal **double damage**. You start with a Pistol + AR; loot the rest from chests and eliminated rivals.

## 🧱 Real building

Switch to Build mode (**B**) and place textured pieces: **walls, doors** (walk through the gap), **windows** (see & shoot through, but blocked from walking), **floors, climbable ladders**, and **turrets**. Building uses a Fortnite-style grid: **floors tile on cell centres and walls snap to the cell edge you're facing**, so they line up flush into rooms. Collision is **height-aware** — walls block you at ground level but you can **walk on top of them** (and across upper floors). Face a ladder and hold **W** to climb. Pieces cost **wood 🪵** (from trees).

**Three resources:** chop **trees with the axe** for **wood 🪵** (builds), mine **rocks with the pickaxe** for **stone 🪨**, and mine the reddish **iron ore deposits** with the pickaxe for **metal 🔩** (also common in chests). Aim at any wooden wall/door/window/floor you built and press **U** to spend stone and **upgrade it to stone** — far more health and a stone-brick look.

## 🔊 Sound

Weapon fire, reloads, hitmarkers and turret shots are all synthesized in-browser with the Web Audio API — no external audio files, works fully offline. Each weapon has its own report (punchy pistol, snappy SMG, boomy shotgun, cracking sniper).

### 🎵 Apocalypse soundtrack

The background music is a real **post-apocalyptic dark-ambient soundtrack**. A calm, desolate track ("Empty World") plays by **day**, and it **crossfades into a tenser, dread-filled track ("Meteor Strike") when night falls**, easing back at dawn. The tracks live in [`music/`](music/) bundled with the game (so it works offline) as both **`.mp3` and `.ogg`** — the game auto-picks whichever the browser supports, so it plays everywhere including **Safari/iOS**. Press **M** to toggle it.

**Music credit:** composed by **Kaelin Bougneit**, from the [CDDA Music Pack](https://github.com/onura46/Kaelin-Bougneit-CDDA-Music-Pack), licensed **CC-BY-SA-4.0** and used unmodified. See [`music/CREDITS.md`](music/CREDITS.md) for full attribution. More of the artist's work: [bandcamp](https://kaelinbougneit.bandcamp.com/).

## 🚁 Helicopter deploy + locations

Every match starts with a **helicopter drop**: you skydive from ~130m, free-fall, then a **blue-and-yellow parachute** opens and you glide down with WASD. Explore themed landmarks — a **МАГАЗИН (shop)** stuffed with loot, a **ТЦК** compound (with its own **ТЦК бусік** van parked outside), plus **waving Ukrainian flags** everywhere and snow-capped **mountains** ringing the map.

> **Keyboard layout note:** movement reads *physical* keys (`e.code`), so WASD works on any layout — including Ukrainian/Cyrillic. (Earlier it broke because the browser reported "ц" instead of "w".)

## 🚁 Enemy helicopters & the Bazooka

Four **enemy helicopters** patrol the sky each match (orange blips on the minimap). Shoot one down — it takes sustained fire — and it **drops a Bazooka 🚀** that parachutes... well, plummets to the ground. Pick it up (slot **8**) and fire rockets that fly out and **explode on impact**, dealing splash damage to enemies, structures, and other helis. Mind the blast radius — it can hurt you too.

## 🌲 Procedural world

The island is **procedurally generated** from a random seed each time the page loads, so every world is different. A value-noise **forest-density field** clusters ~460 trees into real woods and clearings (two tree types — pines and round oaks), while rocks gather in the sparser patches. Reload for a fresh map.

## 🌪️ Battle royale systems

- **Shrinking Storm** — a purple zone that closes in over multiple phases and damages anyone caught outside.
- **101-player lobby** — 100 AI rivals that wander, hunt, strafe, flee the storm, and drop loot.
- **Health + Shields** — shields absorb damage first; heal and shield from loot.
- **Loot chests** near houses and scattered across the map.
- **HUD + minimap** — players alive, eliminations, storm phase, killfeed, and a live radar.

## 🏆 How to win

Outlast all 100 opponents and the Storm for **#1 Victory Royale**.

---

*Storm Royale 3D is an original, fan-made game inspired by the battle-royale genre. It is not affiliated with, endorsed by, or connected to Epic Games or Fortnite.*
