//
//  TrainingModelDota2.swift
//  1win
//
//  Created by Gio's Mac on 15.02.25.
//

import Foundation

let trainingsDota2: [TrainingModelDota2] = [
    TrainingModelDota2(
        image: "dota2SMOKEGank",
        title: "The Five-Man Smoke Gank",
        description: "A coordinated five-player Smoke of Deceit maneuver to catch enemies off guard, gain numerical advantage, and secure objectives.",
        steps: "1. Gather all five heroes in a safe, unwarded area.\n2. Purchase and activate Smoke of Deceit.\n3. Move quickly towards a high-value enemy target.\n4. Engage with an initiator using stuns or disables.\n5. Secure kills and immediately transition into an objective like Roshan or a tower push.",
        advantage: "Bypassing enemy vision ensures surprise attacks.\nSecuring key kills weakens enemy map presence.\nForces enemies into defensive playstyles, reducing their farm."
    ),

    TrainingModelDota2(
        image: "dota2RoshBait",
        title: "Roshan Bait Trap",
        description: "A tactical play where the team fakes a Roshan attempt to lure enemies into an unfavorable fight.",
        steps: "1. Show one or two heroes entering Roshan’s pit.\n2. Have the rest of the team hide nearby in the jungle.\n3. Let the enemy believe you are taking Roshan.\n4. When the enemy moves in, initiate a counter-attack.\n5. If successful, take Roshan after winning the fight.",
        advantage: "Forces enemies into a disadvantageous fight.\nIf executed well, leads to multiple kills and an Aegis.\nCan swing game momentum significantly."
    ),

    TrainingModelDota2(
        image: "dota2SplitPush",
        title: "Global Split Push",
        description: "A strategy focusing on creating constant lane pressure while avoiding direct fights, ideal for heroes with high mobility or summons.",
        steps: "1. Assign heroes like Nature’s Prophet, Anti-Mage, or Tinker to push lanes aggressively.\n2. Maintain vision to avoid unnecessary deaths.\n3. Force enemy heroes to split across the map.\n4. Use teleportation items like Boots of Travel to escape before fights.\n5. Capitalize on split enemy formations for advantageous fights.",
        advantage: "Forces enemies to defend, limiting their aggressive potential.\nMaximizes farm efficiency for core heroes.\nAllows comeback opportunities by exploiting enemy mispositioning."
    ),
    
    TrainingModelDota2(
        image: "dota2HighGroundDefense",
        title: "High Ground Defense",
        description: "A last-stand strategy to repel enemies from sieging your base, requiring precise coordination and spell usage.",
        steps: "1. Position heroes with wave clear and disables near your tier 3 towers.\n2. Hold buybacks for key heroes to counter-initiate.\n3. Bait the enemy into diving by faking retreats.\n4. Use area control abilities (Chronosphere, Ravage, Echo Slam) to punish clustered enemies.\n5. If successful, push back and claim objectives.",
        advantage: "Allows for comebacks even with a net worth disadvantage.\nExploits enemy overextensions.\nMaximizes base defenses to stall the game."
    ),
    
    TrainingModelDota2(
        image: "dota2TriangleControl",
        title: "Triangle Vision Control",
        description: "A vision-based strategy to starve the enemy carry and control farm-heavy areas.",
        steps: "1. Place aggressive wards in the enemy triangle (jungle near their safe lane).\n2. Use mobile heroes to scout and contest jungle creeps.\n3. Prevent the enemy carry from safely farming.\n4. Engage in skirmishes whenever the enemy enters the triangle.\n5. Slowly reduce enemy farm efficiency while increasing yours.",
        advantage: "Chokes the enemy team’s economy.\nReduces enemy carry’s impact in the late game.\nGives your team more control over Roshan and objectives."
    )
]
