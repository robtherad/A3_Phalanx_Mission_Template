showHUD[] = {
	true,	// Scripted HUD (same as showHUD command)
	true,	// Vehicle + soldier info
	true,	// Vehicle radar [HIDDEN]
	true,	// Vehicle compass [HIDDEN]
	true,	// Tank direction indicator
	true,	// Commanding menu
	false,	// Group Bar
	true	// HUD Weapon Cursors
};
class RscTitles {
    class timeleftStructText {
        idd = 9913;
        movingEnable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 9999;
        fadein = 0;
        fadeout = 0;
        name = "timeleftStructText";
        onLoad = "uiNamespace setVariable ['timeleftStructText', _this select 0];";
        onUnLoad = "uiNamespace setVariable ['timeleftStructText', nil]";
        class controls {
            class structuredText3 {
                access = 0;
                type = 13;
                idc = 1003;
                style = 0x00;
                lineSpacing = 1;
                x = safeZoneX + safeZoneW - 0.5 * 3 / 4;
                y = safeZoneY + safeZoneH - 0.033;
                h = 0.033;
                w = 0.5 * 3 / 4; //w == h
                size = 0.020;
                colorBackground[] = {0,0,0,0.85};
                colorText[] = {1,1,1,1};
                text = "";
                font = "TahomaB";
                class Attributes {
                    font = "TahomaB";
                    color = "#FFFFFF";
                    align = "RIGHT";
                    valign = "bottom";
                    shadow = true;
                    shadowColor = "#000000";
                    underline = false;
                    size = "1.4";
                };
            };
        };
    };
    class redforStructText {
        idd = 9911;
        movingEnable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 9999;
        fadein = 0;
        fadeout = 0;
        name = "redforStructText";
        onLoad = "uiNamespace setVariable ['redforStructText', _this select 0];";
        onUnLoad = "uiNamespace setVariable ['redforStructText', nil]";
        class controls {
            class structuredText {
                access = 0;
                type = 13;
                idc = 1001;
                style = 0x00;
                lineSpacing = 1;
                x = safeZoneX + safeZoneW - 0.5 * 3 / 4;
                y = safeZoneY + safeZoneH - 0.063;
                h = 0.03;
                w = 0.5 * 3 / 4; //w == h
                size = 0.020;
                colorBackground[] = {0,0,0,0.85};
                colorText[] = {1,1,1,1};
                text = "";
                font = "TahomaB";
                class Attributes {
                    font = "TahomaB";
                    color = "#CC0000";
                    align = "LEFT";
                    valign = "bottom";
                    shadow = true;
                    shadowColor = "#000000";
                    underline = false;
                    size = "1.4";
                };
            };
        };
    };
    class bluforStructText {
        idd = 9912;
        movingEnable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 9999;
        fadein = 0;
        fadeout = 0;
        name = "bluforStructText";
        onLoad = "uiNamespace setVariable ['bluforStructText', _this select 0];";
        onUnLoad = "uiNamespace setVariable ['bluforStructText', nil]";
        class controls {
            class structuredText2 {
                access = 0;
                type = 13;
                idc = 1002;
                style = 0x00;
                lineSpacing = 1;
                x = safeZoneX + safeZoneW - 0.5 * 3 / 4;
                y = safeZoneY + safeZoneH - 0.099;
                h = 0.036;
                w = 0.5 * 3 / 4; //w == h
                size = 0.020;
                colorBackground[] = {0,0,0,0.85};
                colorText[] = {1,1,1,1};
                text = "";
                font = "TahomaB";
                class Attributes {
                    font = "TahomaB";
                    color = "#0064CC";
                    align = "LEFT";
                    valign = "bottom";
                    shadow = true;
                    shadowColor = "#000000";
                    underline = false;
                    size = "1.4";
                };
            };
        };
    };
};
