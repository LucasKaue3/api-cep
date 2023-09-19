Dir[File.join(File.dirname(__FILE__),
              '../class/*.rb')].sort.each { |file| require file }

module PagesObjects

  def common
    Common.new
  end

  def cep
    Common.new
  end

end
