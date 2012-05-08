defmodule Yo do
  defmacro __using__(module, _opts) do
    quote do
      import Yo, only: [get: 2, post: 2]

      def start do
        Yo.start unquote(module)
      end
    end
  end

  def start(_) do
    IO.puts "Executing Yo.start"
  end
  
  defmacro get(path, [do: code]) do
    #TODO
  end
  
  defmacro post(path, [do: code]) do
    #TODO
  end
end
