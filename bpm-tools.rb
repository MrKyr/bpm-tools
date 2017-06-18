class BpmTools < Formula
  desc "Detect tempo of audio files using beats-per-minute (BPM)"
  homepage 'http://www.pogo.org.uk/~mark/bpm-tools/'
  url 'https://github.com/MrKyr/bpm-tools.git'
  version '0.3'

  option "with-bpm-graph", "Install plot generation script"
  option "with-bpm-tag", "Install audio file tagging script"

  depends_on "gnuplot" if build.with? "bpm-graph"

  if build.with? "bpm-tag"
    depends_on "gnu-sed"
    depends_on "sox"
    depends_on "id3v2"
    depends_on "flac"
    depends_on "vorbis-tools"
  end

  def install
    system "make"
    bin.install "bpm"
    bin.install "bpm-graph" if build.with? "bpm-graph"
    bin.install "bpm-tag" if build.with? "bpm-tag"
    man1.install "bpm.1"
    man1.install "bpm-graph.1" if build.with? "bpm-graph"
    man1.install "bpm-tag.1" if build.with? "bpm-tag"
  end
end
