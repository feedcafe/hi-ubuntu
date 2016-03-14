src:=$(shell ls *.rmvb)
des:=$(subst rmvb,mp3,$(src))

all:$(des)
	echo "convert successfully, you get:$(des)"

%.mp3:%.rmvb
	avconv -i  $< $@
