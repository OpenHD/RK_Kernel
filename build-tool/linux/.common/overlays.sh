custom_source_action() {
    git_source https://github.com/openhd/overlays.git ecb04707f19f74ed021f114c99ace08b39a8ce2a
    cp -r $SCRIPT_DIR/.src/overlays/arch $TARGET_DIR
}
