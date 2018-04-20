class Wrapped
	
	def wrap(word,limit)
		col = 0 
		wrap = ""

		space = word[0...limit].index(" ")
		space = 0 if space.nil?
		if space <= limit && word[0..limit].count(" ") == 1 
			return word.gsub!(" ","\n")
		end 

		if word.length <= limit 
			word
		else 
			while col < word.length  do
				wrap << word[col,limit].strip << "\n" 
				col += limit
			end 

			wrap.strip

		end 
	end 
end

describe Wrapped do 
	word = Wrapped.new
	describe "#wrap" do
		it "return empty string when the word is empty" do
			expect(word.wrap("",7)) .to eq ("")
		end 

		it "return the word when the word shorter than limit" do
			expect(word.wrap("word",7)) .to eq ("word")
		end 

		it "split the one word" do
			expect(word.wrap("word",3)) .to eq ("wor\nd")
		end 

		it "split one word many times" do
			expect(word.wrap("abcdefghij", 3)) .to eq ("abc\ndef\nghi\nj")
		end 

		it "split long long word" do
			expect(word.wrap("longlongword", 4)) .to eq ("long\nlong\nword")
		end 


		it "wrap two words after space" do
			expect(word.wrap("word word", 6)) .to eq ("word\nword")
		end 

		it "wrap three words after space" do
			expect(word.wrap("word word word", 6)) .to eq ("word\nword\nword")
		end 

		it "wrap before boundary" do
			expect(word.wrap("word word", 4)) .to eq ("word\nword")
		end 

		it "should wrap text at the last space before the wrap length" do
			expect(word.wrap("word word", 5)) .to eq ("word\nword")
			expect(word.wrap("word word word", 5)) .to eq ("word\nword\nword")
			expect(word.wrap("word word word", 10)) .to eq("word word\nword")
		end 

		it "Long words without spaces should be broken at the wrap length" do
			expect(word.wrap("wordword", 4)) .to eq ("word\nword")
		end 

	end 
end 