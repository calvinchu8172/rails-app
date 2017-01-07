module DownloadHelper

  def downloads
    Dir[Rails.root.join('tmp', 'downloads', '*')]
  end

  def download
    downloads.first
  end

  def download_basename
    wait_for_download
    File.basename(download)
  end

  def download_content
    wait_for_download
    File.read(download)
  end

  def csv_file
    begin
      CSV.parse(download_content)
    rescue ArgumentError
      CSV.read(download, col_sep: "\t", encoding: "bom|utf-16le")
    end
  end

  def excel_file
    Roo::Excelx.new(download)
  end

  def wait_for_download
    Timeout.timeout(5) do
      sleep 0.5 until downloaded?
    end
    sleep 0.5
  end

  def downloaded?
    !downloading? && downloads.any?
  end

  def downloading?
    downloads.grep(/\.part$/).any?
  end

  def clear_downloads
    FileUtils.rm_f(downloads)
  end
end

World DownloadHelper
