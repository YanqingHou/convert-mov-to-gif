# encoding: utf-8

APP_ROOT = File.dirname(__FILE__)

@@mov文件名 = "1214_田字格"

class Converter
  @@mov视频大小 = "1032x542" # 查看mov文件属性
  # Default path to ffmpeg installed by homebrew
  @@ffmpeg   = File.join('/', 'usr', 'local', 'bin', 'ffmpeg')
  # Default path to gifsicle installed by homebrew
  @@gifsicle = File.join('/', 'usr', 'local', 'bin', 'gifsicle')

  @@像素格式 = "rgb8"
  # Tell ffmpeg to reduce the frame rate from to 30
  @@帧数 = 30

  # Tell gifsicle to delay 30ms between each gif (in ms)
  @@延时 = 3
  # Requests that gifsicle use the slowest/most file-size optimization
  @@优化 = 3
  
  def initialize(输入, 输出)
    命令 = %{#{@@ffmpeg} -i #{输入} -s #{@@mov视频大小} -pix_fmt #{@@像素格式} -r #{@@帧数} -f gif - | #{@@gifsicle} --optimize=#{@@优化} --delay=#{@@延时} > #{输出}}
    
    %x[ #{命令} ]
  end  
end

# Be careful not to use spa ces.
输入 = File.join(APP_ROOT, 'media', @@mov文件名 + '.mov')
输出 = File.join(APP_ROOT, 'media', @@mov文件名 + '.gif')

Converter.new(输入,输出)
