#!/usr/bin/env bash
# Copies the project figures from the old Wix site into this repo.
# Run from the repository root:  bash scripts/download_project_images.sh
set -euo pipefail
W="https://static.wixstatic.com/media/57e15a_"

get() {  # get <wix-id-with-ext> <destination>
  mkdir -p "$(dirname "$2")"
  if [ -s "$2" ]; then echo "exists  $2"; return; fi
  curl -fsSL "$W$1" -o "$2" && echo "saved   $2" || echo "FAILED  $2"
}

P=images/projects/polsar-decomposition
get fbc72f2f61ac4b15ae2d383ca8dd287a~mv2.png $P/emisar-foulum.png
get 02d8502e5aa24973be0af276728c80bf~mv2.jpg $P/krogager-sphere.jpg
get f490cbfbb680485a9f7558ce4e5fd0c1~mv2.jpg $P/krogager-diplane.jpg
get 7e94878a3e35438e8f900ec590e158f0~mv2.jpg $P/krogager-helix.jpg
get 89cae56ba20043fe861ca3b09d387ab5~mv2.png $P/krogager-rgb-annotated.png
get ed1ecd578f0849cb80837258f027f029~mv2.jpg $P/entropy.jpg
get 72e9f7ad466e40c6ab4f5e4e86925755~mv2.jpg $P/anisotropy.jpg
get 40cfc5cc315e468db2bc3698fdb624b1~mv2.jpg $P/alpha.jpg
get 7f2bafb292fd48af9531a8aab32bf826~mv2.jpg $P/h-a-alpha-rgb.jpg

P=images/projects/polsar-svm
get e7cd55d3b5bf46ada7ff40b5ecbedcca~mv2.png $P/features-4.png
get 0b0d39e8f1db4bab81a12051dfa2c48c~mv2.png $P/classified-4features.png
get 70daf360b59d4326a1accaf3c2152313~mv2.png $P/confusion-4features.png
get 22d6e87fed3843de8da6f27225c9180b~mv2.png $P/classes-4features.png
get 16c594ecf1184f61ae5b0a66310ecdd0~mv2.png $P/classified-13features.png
get c192305057da488bae354dbc9c4d6d38~mv2.png $P/confusion-13features.png

P=images/projects/insar-ridgecrest
get e9623c11de9c48a5b9228ad07fa90493~mv2.png $P/study-area.png
get 7c89c6d3c0824c8ca8e94db273d5d101~mv2.png $P/workflow.png
get 5c8ee3172b724916972389fa6e2d3c00~mv2.png $P/quicklooks.png
get 3d17e9590b75400f8ba20f842dbbae2b~mv2.png $P/interferogram.png
get 4f659cf2df0c4a5b9af8223e84e6387d~mv2.png $P/deburst.png
get c15bbfbe6a57460f9f1132abc8c1e77a~mv2.png $P/topo-removed.png
get 57e496862f6143e6b4e9247cadded3ca~mv2.png $P/goldstein.png
get 0206226bf3044062b06c5eba7fb34ebe~mv2.png $P/profile-wrapped.png
get f97767489d0e4834b636093b72574916~mv2.png $P/profile-unwrapped.png
get 909368975b2949babb761628f2e0f471~mv2.png $P/displacement.png
get 582870e816994e118f8f3f4a234bfa82~mv2.png $P/displacement-geocoded.png

P=images/projects/neural-network-landcover
get 1cc2eeaf1f4348bfa31dd09e76c7cab6~mv2.png $P/ikonos.png
get 983a204017664bc69cdc5cf1a472b42e~mv2.png $P/roi.png
get c70625e302e045749957aaef032b77b7~mv2.png $P/training-5n.png
get 7458a086a20946818b2fd1e453f44703~mv2.png $P/classified-5n.png
get cb0fe11341c64c4381f73c0f48c78132~mv2.png $P/classes-5n.png
get 8125ee26a78f417dbf59995546ce6cf9~mv2.png $P/result-25n.png

P=images/projects/brain-tumor-detection
get c35a8faeff94403f8e6974640d54509d~mv2.png $P/pipeline.png

get 7ef8841a140f4660bec82cc8835e4379~mv2.png images/portfolio/drought-indices-2005.png

echo "Done."
