## Release & Update Formula

每次在 [podwise-cli](https://github.com/hardhackerlabs/podwise-cli) 发布新版本后，按以下步骤更新 formula：

**1. 在 podwise-cli 仓库打 tag 并发布 Release**

```bash
git tag v0.1.0
git push origin v0.1.0
```

推送 tag 后，CI（GoReleaser）会自动构建各平台二进制并上传到 GitHub Releases，同时生成 checksums.txt。

**2. 在本仓库（homebrew-podwise-tap）运行更新脚本**

```
./update-formula.sh 0.1.0
```

脚本会自动从 GitHub Releases 拉取 checksums.txt，填入四个平台的 SHA256，并更新 Formula/podwise.rb。

**3. 提交并推送**

```
git add Formula/podwise.rb
git commit -m "podwise v0.1.0"
git push
```

用户执行 brew update && brew upgrade podwise 后即可获取新版本。
