custom_source_action() {
    git_source https://github.com/openhd/overlays.git 3d8d93101405f2bc1dfce44ee627d7bb4db108ad
    cp -r ../../overlays/arch $TARGET_DIR
}
