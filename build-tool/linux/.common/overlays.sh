custom_source_action() {
    git_source https://github.com/openhd/overlays.git
    cp -r $SCRIPT_DIR/.src/overlays/arch $TARGET_DIR
}
