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
    quote do
      def handle(:get, unquote(path), _data) do
        unquote(code)
      end
    end
  end
  
  defmacro post(path, [do: code]) do
    # hygiene:false lets us access _data variable in server
    quote hygiene: false do
      def handle(:post, unquote(path), _data) do
        unquote(code)
      end
    end
  end
end
