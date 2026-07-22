# 🌩️ Storm Royale 3D

A full **3D first-person battle royale** in a single HTML file, built with [Three.js](https://threejs.org). Real Fortnite-style building (proper walls, ramps and floors — not tiny cubes), five distinct weapons, a shrinking storm, loot chests and 49 AI opponents. Drop in, loot, build, and be the last one standing.

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
| **1–7** | Combat: 1-5 guns, 6 pickaxe, 7 axe · Build: 1 wall, 2 ramp, 3 floor, 4 turret (30🧱) |
| **F** | Enter / exit a **car** |
| **Mouse wheel** | Cycle weapons |
| **R** | Reload |
| **E** | Open a chest · harvest trees/rocks with pickaxe/axe for materials |

## 🚗 Vehicles, turrets & harvesting tools

- **Drivable cars** — walk up to a car and press **F** to get in. Drive with WASD (accelerate, reverse, steer), and run over enemies at speed. Press **F** again to get out.
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

Switch to Build mode (**B**) and place **full-size walls, climbable ramps, and floors** that snap to a grid, block bullets and body-block enemies — exactly the cover-building loop the genre is known for. Each piece costs 10 materials; gather more from chests and kills.

## 🚁 Helicopter deploy + city

Every match starts with a **helicopter drop**: you skydive from ~130m, free-fall, then a **blue-and-yellow parachute** opens and you glide down with WASD onto a **downtown full of skyscrapers**. The island is dotted with **waving Ukrainian flags**, snow-capped **mountains** ring the map, and there are far more buildings and landmarks to fight over.

> **Keyboard layout note:** movement reads *physical* keys (`e.code`), so WASD works on any layout — including Ukrainian/Cyrillic. (Earlier it broke because the browser reported "ц" instead of "w".)

## 🌪️ Battle royale systems

- **Shrinking Storm** — a purple zone that closes in over multiple phases and damages anyone caught outside.
- **50-player lobby** — 49 AI rivals that wander, hunt, strafe, flee the storm, and drop loot.
- **Health + Shields** — shields absorb damage first; heal and shield from loot.
- **Loot chests** near houses and scattered across the map.
- **HUD + minimap** — players alive, eliminations, storm phase, killfeed, and a live radar.

## 🏆 How to win

Outlast all 49 opponents and the Storm for **#1 Victory Royale**.

---

*Storm Royale 3D is an original, fan-made game inspired by the battle-royale genre. It is not affiliated with, endorsed by, or connected to Epic Games or Fortnite.*
