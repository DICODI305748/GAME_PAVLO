// Tiny zero-dependency static file server for the game (so .glb models load).
// Run:  node server-static.js   → open http://localhost:8000
const http=require("http"), fs=require("fs"), path=require("path");
const PORT=process.env.PORT||8000, ROOT=__dirname;
const MIME={".html":"text/html; charset=utf-8",".js":"text/javascript",".mjs":"text/javascript",
  ".css":"text/css",".json":"application/json",".map":"application/json",
  ".glb":"model/gltf-binary",".gltf":"model/gltf+json",".bin":"application/octet-stream",
  ".ogg":"audio/ogg",".mp3":"audio/mpeg",".wav":"audio/wav",
  ".png":"image/png",".jpg":"image/jpeg",".jpeg":"image/jpeg",".gif":"image/gif",
  ".svg":"image/svg+xml",".ico":"image/x-icon",".webp":"image/webp",".wasm":"application/wasm"};
http.createServer((req,res)=>{
  let p=decodeURIComponent((req.url||"/").split("?")[0]);
  if(p==="/"||p.endsWith("/")) p+="index.html";
  const fp=path.normalize(path.join(ROOT,p));
  if(!fp.startsWith(ROOT)){ res.writeHead(403); return res.end("Forbidden"); }
  fs.readFile(fp,(err,data)=>{
    if(err){ res.writeHead(404,{"Content-Type":"text/plain; charset=utf-8"}); return res.end("404 — файл не знайдено: "+p); }
    res.writeHead(200,{"Content-Type":MIME[path.extname(fp).toLowerCase()]||"application/octet-stream"});
    res.end(data);
  });
}).listen(PORT,()=>{
  console.log("");
  console.log("  🎮 Гра запущена!  Відкрий у браузері:  http://localhost:"+PORT);
  console.log("  (не закривай це вікно, поки граєш)");
  console.log("");
});
