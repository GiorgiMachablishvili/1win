//
//  TrainingModelValorant.swift
//  1win
//
//  Created by Gio's Mac on 16.02.25.
//

import Foundation

let trainingsValorant: [TrainingModelValorant] = [

    TrainingModelValorant(
        image: "VALSplitAExecute",
        title: "Split A Execute (Ascent)",
        description: "A well-coordinated execute on A Site in Ascent, using Mid control and Utility to push from two angles.",
        steps: """
        1. Two players take Mid Control (Catwalk & Market) while three prepare for A Main push.
        2. Smoke off A Heaven and A Door to limit defender vision.
        3. Flash into A Site to blind enemies holding aggressive angles.
        4. Entry fragger moves first while others trade efficiently.
        5. Plant the Spike in a safe position (Default or Generator).
        6. Hold post-plant positions from A Main, Heaven, and Tree.
        """,
        advantage: """
        - Forces defenders to hold multiple angles.
        - Reduces risk of being picked by an Operator.
        - Strong post-plant control, making retakes difficult.
        """
    ),

    TrainingModelValorant(
        image: "VALDefaultMidControl",
        title: "Default Mid Control (Haven)",
        description: "A passive strategy focusing on Mid Control before deciding on a site push.",
        steps: """
        1. Spread out with one player watching A Lobby, two holding Mid, and two watching C Long.
        2. Use utility (smokes and flashes) to clear Garage and Mid Window.
        3. Apply pressure with Mid presence while waiting for defender rotations.
        4. If a pick is secured, commit to the corresponding bomb site.
        5. Use flank control and rotate if necessary before executing the plant.
        """,
        advantage: """
        - Gathers early round map control and information.
        - Keeps defenders guessing, forcing them to waste utility.
        - Flexible execution options depending on defender setup.
        """
    ),

    TrainingModelValorant(
        image: "VALFastBExec",
        title: "Fast B Execute (Bind)",
        description: "A rapid, aggressive push onto B Site using coordinated utility and entry fragging.",
        steps: """
        1. Initiator flashes Hookah while another teammate uses a Smoke on Elbow.
        2. Two players push Hookah, while three push through B Long.
        3. Use a Molotov or Nade to clear common spots (B Default, Close Right).
        4. Entry fragger moves in first with teammates trading effectively.
        5. Plant the Spike for Hookah or B Long while securing post-plant positions.
        """,
        advantage: """
        - Overwhelms defenders before they can react.
        - Effective against teams that play passive defense.
        - Sets up strong post-plant control with multiple angles.
        """
    ),

    TrainingModelValorant(
        image: "VALRetakeStrategy",
        title: "Defender Retake Strategy (Icebox)",
        description: "A structured approach to retaking a planted Spike as defenders.",
        steps: """
        1. Wait for teammates before attempting the retake.
        2. Use smokes to block off attacker sightlines.
        3. Flash into the site to force enemies out of hiding spots.
        4. Clear angles methodically (Default, Generator, Rafters).
        5. Stick the defuse if numbers are in your favor or trade efficiently.
        """,
        advantage: """
        - Increases success rate of retakes with team coordination.
        - Prevents unnecessary peeks and solo fights.
        - Maximizes defender utility usage for better positioning.
        """
    ),

    TrainingModelValorant(
        image: "VALFakeSiteExecute",
        title: "Fake Site Execute (Split)",
        description: "A strategy designed to bait enemy rotations by faking a full commitment to a bombsite.",
        steps: """
        1. Send three players to one site with full utility usage (Smokes, Flashes, Nades).
        2. The remaining two lurk in Mid or the opposite bomb site.
        3. The fake team applies pressure but does not commit to a full execute.
        4. Once defenders rotate, regroup and hit the weaker site.
        5. Secure the site, plant the Spike, and hold post-plant positions.
        """,
        advantage: """
        - Baits defenders into rotating and leaving a site vulnerable.
        - Creates opportunities to secure easier plants.
        - Confuses enemy team, forcing them to play reactively.
        """
    )
]

