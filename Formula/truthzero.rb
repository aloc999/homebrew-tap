class Truthzero < Formula
  desc "Autonomous AI pentest swarm for authorized security testing"
  homepage "https://github.com/aloc999/TruthZero"
  url "https://github.com/aloc999/TruthZero/archive/refs/tags/v0.15.0.tar.gz"
  sha256 "6549a771071dc21d1d05869ca90c4044aceaf0ac8bc10bf14d8840178edc24e4"
  license "MIT"

  depends_on "python@3.13"

  def install
    venv = virtualenv_create(libexec, "python3.13")
    venv.pip_install_and_link buildpath
  end

  def caveats
    <<~EOS
      Set an LLM API key before first run, e.g.:
        export ANTHROPIC_API_KEY="sk-ant-..."
      Or run fully local: install Ollama, then
        truthzero -p ollama -m qwen2.5-coder
    EOS
  end

  test do
    assert_match "TRUTHZERO", shell_output("#{bin}/truthzero version")
  end
end
