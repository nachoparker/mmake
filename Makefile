all: mmake xmake

xmake: mmake
	cd xmake; docker build . -t ownyourbits/xmake

mmake:
	cd mmake; docker build . -t ownyourbits/mmake

.PHONY: mmake xmake
