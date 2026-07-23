# 🧟 Zombie Survival 3D

A **3D first-person zombie survival** game in a single HTML file, built with [Three.js](https://threejs.org). Explore a **procedurally generated** world (forests, mountains, a shop, a ТЦК and randomized landmarks), gather **wood 🪵, stone 🪨 and metal 🔩**, and build a fortified base with Fortnite-style pieces. **Every 5 minutes night falls** and a horde of zombies swarms in from the edges — and they **smash through your walls**. Each night there are more of them and they hit harder. Upgrade your walls **wood → stone → metal**, plant **torches and spikes**, mount **turrets**, and survive as many nights as you can.

## 🌙 Day / night survival loop

- **Day (5 min the first time, then shorter):** loot chests, chop trees for wood, mine rocks for stone, and build/upgrade your base. No zombies.
- **Night:** a wave of zombies spawns from the map edges and marches on you, attacking any wall in the way until it breaks. Survive the night and dawn burns away the stragglers.
- **Each night** the wave is bigger, tougher and faster. How many nights can you last?

## 🧱 Base building & upgrades

Build mode (**B**) pieces, all on a Fortnite-style grid: **1** wall · **2** door · **3** window · **4** floor · **5** ladder · **6** turret · **7** torch 🔥 (light) · **8** spikes 🔩 (trap that shreds zombies). Aim at a piece and press **U** to upgrade it a tier — **wood → stone → metal** — spending stone then metal for far more health.

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
