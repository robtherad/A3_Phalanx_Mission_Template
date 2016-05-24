#spect
This module is our spectator module.

###Configure
Have fun.
###Disable
In `description.ext` remove the following lines:

```
#include "f\spect\functions.hpp"
```
***
Edit the following line from:
```
    class f_spectator {
        onPlayerRespawn = "f_fnc_CamInit";
    };
```
To:
```
    class f_spectator {
        onPlayerRespawn = "";
    };
```