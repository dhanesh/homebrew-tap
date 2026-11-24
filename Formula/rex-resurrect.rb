class RexResurrect < Formula
  desc "Save Rex sessions, windows, panes and folders; offer to restore them"
  homepage "https://github.com/dhanesh/rex-resurrect"
  url "https://github.com/dhanesh/rex-resurrect/releases/download/v0.1.1/rex-resurrect.tar.gz"
  sha256 "f47b6d1cc0408284700deff095a3b1552f3b3e9e127b438fa051ef0dc2192ded"
  license "MIT"

  def install
    libexec.install Dir["*"]
    # opt_libexec stays the same path across upgrades, so the plugin link that
    # `rex-resurrect setup` makes in ~/.config/rex keeps working after them.
    (bin/"rex-resurrect").write_env_script libexec/"bin/rex-resurrect",
      REX_RESURRECT_HOME:    opt_libexec,
      REX_RESURRECT_MANAGED: "brew"
  end

  service do
    run ["/bin/sh", opt_libexec/"resurrect/resurrectd.sh"]
    keep_alive true
    process_type :background
    # resurrectd.sh writes its own size-capped log to ~/.local/state/rex-resurrect.
    log_path File::NULL
    error_log_path File::NULL
  end

  def caveats
    <<~EOS
      Once per user, hook the plugin into Rex and start the saver:
        rex-resurrect setup
        brew services start rex-resurrect

      Optional, per-pane shell history and output: add to ~/.zshrc
        [ -r ~/.config/rex/resurrect/shell/rex-resurrect.zsh ] && . ~/.config/rex/resurrect/shell/rex-resurrect.zsh
      (bash: ~/.bashrc and rex-resurrect.bash). See the README.

      Before `brew uninstall`, run `rex-resurrect remove` and
      `brew services stop rex-resurrect`.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rex-resurrect version")
    system "sh", "-n", libexec/"install.sh"
    system "sh", "-n", libexec/"resurrect/resurrectd.sh"
  end
end
