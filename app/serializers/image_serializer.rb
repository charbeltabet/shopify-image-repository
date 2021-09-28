class ImageSerializer
  include ActiveModel::Serialization

  attr_accessor :attr_name

  def attr_name
    { 'attr_name' => 1 }
  end
end
