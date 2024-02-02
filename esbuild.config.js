const esbuild = require("esbuild");

(async () =>
  await esbuild.build({
    entryPoints: ["./src/main.ts"],
    bundle: true,
    platform: "node",
    target: ["node16"],
    outdir: "dist",
    sourcemap: false,
    treeShaking: true,
    packages: "external",
  }))();
