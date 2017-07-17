defmodule M do
  defmacro plus1(a) do
    quote do
      unquote(a) + 1
    end
  end

  def plus2(a) do
    a + 2
  end

  defmacro macro_if(clause, then_exp, else_exp) do
    quote do
      if unquote(clause) do
        unquote(then_exp)
      else
        unquote(else_exp)
      end
    end
  end

  def func_if(clause, then_exp, else_exp) do
    if clause do
      then_exp
    else
      else_exp
    end
  end

  defmacro explain_macro(code) do
    IO.inspect code
    code
  end

  def explain_func(code) do
    IO.inspect code
    code
  end
end
