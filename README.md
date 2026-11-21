# Project 2D Plateformer – GameJam

Jeu de plateforme 2D développé avec **Godot 4.6** dans le cadre d'une Game Jam.

## À propos

Incarne un **chevalier** qui traverse quatre zones remplies de pièges et de monstres. Saute entre des plateformes mobiles, évite les pics et les slimes, et récupère un parchemin qui débloque le double saut pour franchir les passages les plus difficiles.

## Fonctionnalités

- Personnage jouable avec déplacements et saut (animations de chevalier)
- **4 zones** enchaînées, avec changement de zone par des points de sortie
- **Double saut** à débloquer en ramassant un parchemin
- **Plateformes mobiles** (horizontales et verticales)
- **Slimes** ennemis : ils patrouillent, repèrent le joueur et le poursuivent
- **Pics** mortels
- Caméra qui suit le joueur et reste dans les limites de chaque zone
- Mort et réapparition au point de départ
– capacité de sauter même au-dessus du vide (mécanique particulière et distinctive du jeu)

## Contrôles

| Action | Touches |
|---|---|
| Aller à gauche | `A` (`Q` sur clavier AZERTY) ou `←` |
| Aller à droite | `D` ou `→` |
| Sauter | `Espace`, `W` (`Z` sur clavier AZERTY) ou `↑` |
| Double saut | Appuyer à nouveau sur saut en l'air (après avoir récupéré le parchemin) |

## Technologies

- **Moteur :** [Godot Engine](https://godotengine.org/) 4.6 (rendu Forward+)
- **Langage :** GDScript
- **Graphismes :** Aseprite (sprites, tilesets, palette)

## Installation et lancement

1. Installe **Godot 4.6** (ou une version compatible 4.x).
2. Clone le dépôt :

   ```bash
   git clone https://github.com/Lileur/Project_2D_Plateformer_GameJam.git
   ```

3. Dans Godot, clique sur **Importer** et sélectionne le fichier `Jeu_2D_Plateformer/project.godot`.
4. Lance le jeu avec **F5** (ou le bouton ▶).

## Structure du projet

```
Project_2D_Plateformer_GameJam/
├── Assets/                 # Sources graphiques (Aseprite) et planches d'animation
│   ├── animation/          # Chevalier, slime, lianes…
│   └── sprites/            # Sprites du chevalier et de l'environnement
├── Game_Design.md          # Document de game design
└── Jeu_2D_Plateformer/     # Projet Godot
    ├── project.godot
    ├── Assets/             # Ressources importées dans le jeu (tilesets, sprites)
    ├── Scenes/             # Scènes : joueur, zones, slime, pics, gestionnaire de zones
    └── Scripts/            # Scripts GDScript (joueur, ennemis, plateformes, zones)
```

### Scripts principaux

| Script | Rôle |
|---|---|
| `Player.gd` | Déplacements, saut, double saut, mort |
| `slime.gd` | Comportement du slime (patrouille, poursuite, attaque) |
| `spike.gd` | Pics qui tuent le joueur |
| `dbj_scroll.gd` | Parchemin qui débloque le double saut |
| `Plateforme*.gd` | Plateformes mobiles |
| `ZoneManager.gd` | Chargement des zones (autoload) |
| `exite_to_zone_*.gd` | Points de passage entre les zones |

## Équipe

- [@Lileur](https://github.com/Lileur)
- [@Mathieu Jin]
