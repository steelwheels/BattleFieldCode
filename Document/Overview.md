# Game system for Battlefield code

## Overview
The *Battlefield code* is a team battle game.
Two or more teams battle on a filed until the winner is decided.
The team consists of some machines such as tanks and planes.
The user controls them by the program implemented by [JavaScript](https://en.wikipedia.org/wiki/JavaScript).

## Field
The battle field is defined as 2 dimensional area which has limited width and height.
Here is an example of battle field which has 5x5 area.
````
          <north>
        ..........          ; A1, A2, ...   : Machine on team-A
        ..A1......          ; B1, B2, ...   : Machine on team-B
<west>  ....**....  <east>  ; Obstacle      : Obstacle which present machine movement
        ......B1..          ; "."           : Movable area
        ..........          ;
          <south>
````


## Team
User can control machines a their team.
Each team contains one or more machines.

## Machine

### Kind of the machines
There are some kind of the machine:

|Kind        |Description                            |
|:----       |:----                                  |
|Tank        |Run on the field. The tank has 1 missile pod |

### Specification of the machines
The machine has following attributes:

|Specification |Description                           |
|:----         |:----                                 |
|Fuel capacity |Max capacity of the fuel tanks        |
|Fuel consumption |The fuel usage to move unit range. |

### Actions of the machines
The machine has following actions:

|Actions      |Description                            |
|:----        |:----                                  |
|search       |Search objects around the machine by the radar. The range of the radar is limited. |
|move         |Move to north/south and west/east. The movable distance is limited. |
|aim          |Aim the target by rotating turret. |
|fire         |Fire the missile |

### Status of the machine
Every machines has following status:

|Status       |Description                            |
|:---         |:---                                   |
|fuel ratio   |The filling rate of the fuel. If this value will be zero, the machine become inoperable. |
|trouble ratio | If this value become 100%, the machine become inoperable.|

## Finalize the game
TOB

## Battle
### Game sequence
1. Setup
  * Select the rule
  * Team organization
  * Determine the rule. Condition to become winner.
  * Select the user script
2. Start the battle
  * Loop until the winner is decided:
    1. Update the battle field map
    2. Update the state of missiles and decide collision
    3. Call `action` for each machines. The order is decided by the speed of them.
3. Display results


## Related links
* [Battlefield code Project](https://github.com/steelwheels/BattleFieldCode/blob/master/README.md): Project top page
* [Steel Wheels Project](http://steelwheels.github.io): The steel wheels project main page
