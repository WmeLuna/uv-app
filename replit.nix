{ pkgs }: {
  deps = with pkgs; [
    busybox
    nodejs-slim
  ];
}