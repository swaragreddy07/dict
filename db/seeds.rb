# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Word.destroy_all
Word.create([
  {
    word: "house",
    def:[{"text":"A structure serving as a dwelling for one or more persons, especially for a family."},{"text":"A household or family."},{"text":"Something, such as a burrow or shell, that serves as a shelter or habitation for a wild animal."},{"text":"A dwelling for a group of people, such as students or members of a religious community, who live together as a unit:  a sorority house. "},{"text":"A building that functions as the primary shelter or location of something:  a carriage house; the lion house at the zoo. "},{"text":"A facility, such as a theater or restaurant, that provides entertainment or food for the public:  a movie house; the specialty of the house. "},{"text":"The audience or patrons of such an establishment:  a full house. "},{"text":"A commercial firm:  a brokerage house. "},{"text":"A publishing company:  a house that specializes in cookbooks. "},{"text":"A gambling casino."}],
    exam:{"examples":[{"text":"House prices could be supported by purchase of housing -- house buyer of last resort."},{"text":"You'll see, we'll have a Marxist in the White House now, and Marxists running the house and senate."},{"text":"Last weekend, I set about to decorate my perfect tree. in my scaled down, dream house, for my very first christmas ~in the blue and white house~ celebrating my \"this is as good as it gets\" reality."},{"text":"My dad continued working at the post office and we moved to a house on e 38th court before I turned one… my house… just a little bit of background info…"},{"text":"He actually was so upset at me that he drove us back to his house, got out of my truck, and walked inside the house…"}]},
    related:[{"relationshipType":"synonym","words":["abode","residence","dwelling","tenement","household","tribe","inn","hotel","audience","harbor"]}]
  },
  {
    word: "brace",
    def: {"definitions":[{"text":"A device that holds or fastens two or more parts together or in place; a clamp."},{"text":"A device, such as a supporting beam in a building or a connecting wire or rope, that steadies or holds something else erect."},{"text":"Chiefly British   Suspenders."},{"text":"An orthopedic appliance used to support, align, or hold a bodily part in the correct position."},{"text":"A dental appliance constructed of bands and wires that is fixed to the teeth to correct irregular alignment. Often used in the plural."},{"text":"An extremely stiff, erect posture."},{"text":"A cause or source of renewed physical or spiritual vigor."},{"text":"A protective pad strapped to the bow arm of an archer."},{"text":"Nautical   A rope by which a yard is swung and secured on a square-rigged ship."},{"text":"A cranklike handle with an adjustable aperture at one end for securing and turning a bit."}]},
    exam:{"examples":[{"text":"The term brace, which imports a pair, was employed."},{"text":"Going back to a brace is a step backward; digression."},{"text":"But the point I refer to is this: the old instrument, the trepan, had a handle like a wimble, what we call a brace or bit-stock."},{"text":"Hanging on the brace was a large copper kettle, its sides blackened with soot."},{"text":"Second course, what they're calling a brace of American birds, and the third and final course, apple sponge cake."}]},
    related:["relatedWords":[ {"relationshipType":"synonym","words":["tension","bitstock","pair","couple","suspenders","harness","vantbrace","tighten","strain","strengthen"]}]]
  }

])
