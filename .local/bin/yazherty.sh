#!/bin/sh
# Swap YA and ZHE in russian phonetic keyboard
cd /usr/share/X11/xkb/symbols/
patch -p6 -b <<EOD
--- /usr/share/X11/xkb/symbols/ru	2008-04-15 04:53:53.000000000 +0200
+++ ru-yazherty	2008-09-16 11:22:16.000000000 +0200
@@ -180 +180 @@
-    key	<LatW> {	[     Cyrillic_ve,     Cyrillic_VE	]	};
+    key	<LatW> {	[     Cyrillic_zhe,     Cyrillic_ZHE	]	};
@@ -185 +185 @@
-    key	<LatV> {	[    Cyrillic_zhe,    Cyrillic_ZHE	]	};
+    key	<LatV> {	[    Cyrillic_ve,    Cyrillic_VE	]	};
EOD
