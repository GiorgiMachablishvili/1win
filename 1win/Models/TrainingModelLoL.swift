//
//  TrainingModelLoL.swift
//  1win
//
//  Created by Gio's Mac on 16.02.25.
//

import Foundation

let trainingsLoL: [TrainingModelLoL] = [
    TrainingModelLoL(
        image: "LOLEarlyGameInvade",
        title: "Early Game Jungle Invade",
        description: "This strategy involves invading the enemy jungle at level 1 to disrupt the enemy jungler and gain an early game advantage.",
        steps: """
        1. Gather as a team near the enemy jungle entrance.
        2. Use a ward in the river to check for vision before proceeding.
        3. Move as a coordinated unit to surprise and catch out the enemy jungler.
        4. Focus fire on a single target and secure the first blood.
        5. Steal the enemy's buff to slow down their jungle pathing.
        6. Return safely to your lanes or reset in the base.
        """,
        advantage: """
        - Delays the enemy jungler’s first clear and experience.
        - Increases your team's gold advantage early on.
        - Creates early game pressure in lanes by forcing an enemy flash or summoner spell.
        """
    ),

    TrainingModelLoL(
        image: "LOLLaneFreeze",
        title: "Wave Control - Freezing the Lane",
        description: "Freezing the lane is a wave control strategy that forces the enemy laner to overextend, making them vulnerable to ganks.",
        steps: """
        1. Last-hit only when necessary to keep the minion wave in one spot.
        2. Let the enemy push naturally by not attacking their minions aggressively.
        3. Position yourself close to the wave but outside of immediate enemy range.
        4. Call for your jungler to take advantage of the enemy’s overextended position.
        5. If the enemy laner backs off, deny them CS by maintaining the freeze.
        """,
        advantage: """
        - Forces the enemy laner into a dangerous position.
        - Reduces the risk of getting ganked.
        - Helps secure CS advantage by denying enemy farm.
        """
    ),

    TrainingModelLoL(
        image: "LOLRoamingStrategy",
        title: "Roaming as a Mid Laner",
        description: "A strong roaming strategy allows mid laners to impact side lanes and create leads across the map.",
        steps: """
        1. Push your wave quickly before looking for a roam opportunity.
        2. Check the minimap to see if bot lane or top lane is overextended.
        3. Ping your teammates to inform them of your roam.
        4. Use vision control to avoid being spotted by enemy wards.
        5. Engage with CC or burst damage to secure a kill or force summoner spells.
        6. Return to mid-lane immediately to minimize CS loss.
        """,
        advantage: """
        - Helps snowball side lanes for a stronger late-game.
        - Creates map pressure by making the enemy laners cautious.
        - Increases kill participation and team synergy.
        """
    ),

    TrainingModelLoL(
        image: "LOLDragonControl",
        title: "Objective Control - Securing the Dragon",
        description: "Controlling dragons is essential for stacking buffs and gaining a significant mid-to-late game advantage.",
        steps: """
        1. Secure vision control around the dragon pit before it spawns.
        2. Push your lanes so the enemy team can't rotate easily.
        3. Ping your team and ensure that everyone is ready for a fight if necessary.
        4. If possible, try to pick off an enemy before starting the dragon.
        5. Use Smite properly to secure the objective against enemy steals.
        6. Reset immediately after securing the dragon to maintain tempo.
        """,
        advantage: """
        - Grants permanent buffs and soul benefits in the late game.
        - Forces enemy team to contest, leading to potential picks or team fights.
        - Provides strong map control around bot side.
        """
    ),

    TrainingModelLoL(
        image: "LOLBaronNashorCall",
        title: "Making the Right Baron Nashor Call",
        description: "Properly deciding when to take Baron Nashor can determine the outcome of a game.",
        steps: """
        1. Wait until the enemy team is at a disadvantage (e.g., 1-2 members dead).
        2. Ensure you have vision control around the Baron pit.
        3. Have a tank start the Baron while the rest of the team deals damage.
        4. Use zoning abilities or engage tools to prevent enemy contestation.
        5. Smite at the right time to avoid enemy steals.
        6. Push lanes immediately after securing Baron to maximize its effectiveness.
        """,
        advantage: """
        - Grants a massive gold and buff advantage for team fights.
        - Allows easier lane pushing and sieging.
        - Forces the enemy to react, creating additional kill opportunities.
        """
    )
]
