# ___Les modules Mixins

module A
	def demo
		puts demo
	end
end

class C
	extend A
end

c = C.new
c.extend(A)
c.demo
