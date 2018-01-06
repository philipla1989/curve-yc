# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Story.create(name: 'Terrance Kwok', location: "Kitchener, ON, Canada",
            linkedin_url: "https://www.linkedin.com/in/terrancekwok/", ini_age: 25, sub_age: 28,
            ini_title: "Senior Accountant", ini_career_path: "Accountant",
            ini_industry: "Professional Services", ini_company: "KPMG", ini_company_type: "Corporate",
            sumary: "No sumary provided", vanity_url: "some_url",
            quote: "This is some quote for the home page card, this should be less than 150 characters to avoid increase the size of the card",
            education: "University of Waterloo, Bachelor of Accounting and Financial Management",
            careers_attributes: [
              {
                name: "Sales",
                title: "Sales Development Manager",
                industry: "Technology",
                company: "Vidyard",
                company_type: "Start-Up",
                precedent_career: "Initial",
                story_questions_attributes: [
                  {
                    question: "How did you realize you wanted to change?",
                    response: "After my first year I had a pretty good idea that this wasn’t for me. In university, I spent most of my time not studying and there was no passion for it. Despite that, I ended up getting a desirable accounting job in my first co-op term at one of the big four firms. I remember my first couple weeks in audit with a client I thought to myself… “Oh my god this is going to be the rest of my life” [in a bad way], so I knew pretty quickly this was not going to be for me. It took me a long time to decide I was not going to do it anymore. When you’re going through it you’re investing time and money and all your friends are doing it, so you just keep continuing. I think what really sparked my motivation to change was when I would get up in the morning, even in my first co-op term when I think you should be super excited, and feel completely dead inside. This was really dramatic and unnecessary, I’m pretty grateful in retrospect to have the chance to have those jobs but back then I was an angsty 19 year old teenager.",
                  },
                  {
                    question: "How did you decide what you wanted to change into?",
                    response: "Looking back it was kind of flukey. I had a friend who did accounting and left the program in her third year, and she had gone into sales somehow. She introduced me to someone who was a Chartered Accountant and moved into a sales job at SalesForce. I don’t know why she thought sales would be something good fit for me but she said it was something I could consider since she knew people in accounting who had done it. I hopped on a call with this guy and he sold me on sales. I realized I wanted to get into tech because it seemed like a fun environment to work in, which was the opposite of working at a big accounting firm. I also wanted to be on the revenue generating side of a business. I initially thought of doing accounting at a tech company but on further consideration I realized it would probably more or less the same thing. So this guy talked about how I should try it to see if I like it and if it doesn’t work I could always go back to one of the big accounting firms since I have all the experience. Then I just took the plunge without fully understanding what I was getting myself into.",
                  },
                  {
                    question: "How did you initially decide to go into accounting?",
                    response: "I went to a _performance_ arts high school for music, and I enjoyed it but didn’t feel that I was good enough to make a living off of it, so I wasn’t sure what I wanted to do after high school. When I applied for universities it was a mish-mash of programs including music and accounting. I landed on accounting for a couple reasons - one it seemed pretty stable, and two I had a close family friend who had done the accounting program at the University of Waterloo who told my parents about it so I applied to it.  I feel like there were so many hoops to jump through to get into the program such as writing exams, that when I got the offer I think I felt most invested in it so I just did it… not knowing what accounting really was and what I was getting myself into. It was more of a friends have gone and parents thing.",
                  },
                  {
                    question: "What factors held you back from changing and how did you overcome them?",
                    response: "It was tough, there were a lot of things holding me back such as sunk cost. After my first co-op term in accounting, I decided to give it another chance, and then after I went back I thought maybe it’ll be different when I get promoted next term, and then when I went back I thought maybe it’ll be different when I become full-time. I kept reinvesting time into it and rationalizing why I should keep dong it. Then after five years of school I thought to myself I shouldn’t give up now. Then you just keep thinking you’ll stop doing it after the next milestone - graduation, finishing your professional exam, qualifying for your designation and so on, but you don’t. I look back at how I finally got over it and it was probably a super irrational decision at the time. I was three months away from qualifying for my designation and I decided to quit. I just hit a breaking point, I don’t have a super useful story with an epiphany or anything. I hit a point where I felt that life is too short, and even if meant investing three more months to get to the “finish line” I’m not going to be happy doing it and there’s no point in doing it even though it’s something I’ve been working towards for 6-7 years. After a string of late nights and a brutal amount of work, I just started looking for other opportunities.",
                  },
                  {
                    question: "What initial steps did you take?",
                    response: "During my search I continued in my accounting job but quit once I got my first offer. I applied to a bunch of large tech companies to start cause I was told from a training perspective they would be good. I didn’t get anywhere with those companies since I had no experience.",
                  },
                  {
                    question: "What was your big break?",
                    response: "I looked into Vidyard because I had heard about them when I was in school. I was looking up tech companies in the area and noticed they had grown to thirty people and thought that was pretty promising. I sent a message to some friends who were familiar with the tech scene, one of them happened to know the CEO of Vidyard and introduced me. I went through a bunch of interviews and I guess I had a compelling enough story where they were willing to take a chance and give me an entry level sales position. I think I was able to land the job for a few reasons. First of all, it was an entry level job so they weren’t expecting a ton of experience. A couple things I think helped them take a chance on me - first is I had an interesting and different story. Second is that I played up how I would quit before qualifying for my licence even though I had worked towards it for many years, this showed them how badly I wanted it. I tried to highlight a few other things during the process including how I had a finance background that would be a unique complement to sales, and that I had a track record of interest in technology such as side-projects I worked on and being part of the Velocity entrepreneurship program at my University.",
                  },
                  {
                    question: "What was it like starting in the new career?",
                    response: "It was really hard. Working in the big accounting firms it was quite demanding work and a grind, but I was never as tired in my entire life as my first three months in sales. There’s an entirely different pressure when you are working towards a very clear goal. It’s very different than in professional services where you need to get stuff done on time but the way you’re measured is much more subjective and based on soft behaviours. In sales, it doesn’t matter how good of a person you are, if you’re not at 100% of your goal… you’re not at 100%. That pressure was really tough for me to deal throughout the past three years.",
                  },
                  {
                    question: "What was the challenge of learning sales?",
                    response: "The actual skills training wasn’t that bad around talking to clients. The challenging part of the job was the mindset development, so for example how do you power through when you’re having a bad month or how do you maintain a positive attitude when people are rejecting you over and over again. You have to develop grit to be able to make it to the finish line. I struggled with this a lot. It did end up being okay and I really enjoyed it, but it was incredibly stressful. I would get to work at 6 am to be keen, and leave the office around 7 pm, which was a shorter work day than I was used to, but I would get home and just crash into sleep until the morning.",
                  },
                  {
                    question: "How did you develop sales skills?",
                    response: "A lot of it was just through practical work experience. I had mentorship from my manager and other peers that I leaned on heavily, and then it was lot of executing with trial and error. What I did do in my first couple weeks was follow every single blog and twitter account that was related to tech sales and just immersed myself in it. I wanted to be passively learning at all times through these channels during my downtime. At the end of the day in sales though, reading is one thing though and putting it into practice is another. Also over time I noticed a lot of content is recycled and I didn’t find it as useful as the beginning. One last thing I did a lot of was practicing question techniques. With cold-calling I didn’t get the opportunity that often since a lot of people just don’t want to talk to you, so instead I would apply these techniques with my friends. I would ask them questions and dig in, so that when I did get the opportunity with prospective customers it was second nature.",
                  }
                ]
              },
              {
                name: "Product Manager",
                title: "Associate Product Manager",
                industry: "Technology",
                company: "Vidyard",
                company_type: "Start-Up",
                precedent_career: "Sales",
                story_questions_attributes: [
                  {
                    question: "How do you handle uncertainty around the future of your career?",
                    response: "I’m not sure what I want to do long-term or how Product fits into that. I’m just taking things day by day and enjoying the ride. I find some people get freaked out when they don’t know what the five year plan is, and right now I have no idea what the five year plan is. I feel that at this point you just bounce around in your career depending on what opportunities present themselves, you don’t always have to be thinking about the next step.",
                  },
                  {
                    question: "What are your next steps in progressing in Product?",
                    response: "Just learn as much as I possibly can. I feel like I know nothing, I don’t know what I’m doing, so I’m going to take the next couple years to really learn product whether that is just within Vidyard or taking any classes on the side. Also do the same thing I did when I joined sales, which is following and reading everything about Product out there.",
                  },
                  {
                    question: "What advice would you give to others who want to change their career in general?",
                    response: "To my point earlier, don’t freak out about what you want to do five years from now or what the next thing could be. I think it’s normal not to know what the next step, and all you can really do is talk to as many people as possible, message people on LinkedIn and ask for a coffee. Keep an open mind during the exploration of other career paths. When you do have an idea of where you want to go don’t try to game your career, there’s no guarantee if you do X now you’re going to get to Y later, just learn everyday and enjoy the ride. I think a lot of the growth and opportunities are just based on how hard you’re working today and how much time you’re investing into what you’re currently doing. Don’t always think of how you want to get this title or that job, that means you’re not fully invested in what you’re doing now and that will reflect in the opportunities that end up presenting themselves.",
                  },
                  {
                    question: "How did you realize you wanted to change?",
                    response: "A couple of things happened that got me to product. I moved into a manager role in the past year so wasn’t doing as much actual sales anymore, it was more people and team management. When I was looking at my career I felt I could continue learning a lot more about people management. However, from a sales perspective the next step would be for me to become an Account Executive, who actually closes the deals. Usually people go from people a Sales Development Rep to being an Account Executive. I realized I wasn’t very excited about being an Account Executive and so I was reassessing what I liked about my current role - which included process development, strategy and cross-functional work with product. I realized I enjoyed the non-sales aspects of my job.",
                  },
                  {
                    question: "How did the change happen?",
                    response: "We hired a product manager and since we both commuted to Toronto often I ended up talking with her quite a bit and learned a lot more about Product Management. From there it became more and more enticing. The idea that it was a very strategic role where you’re thinking about why we should be building certain things, how to prioritize and how it should be validated was interesting to me. I was also very passionate about our sales products. The number one customer for our sales products was our own sales team, and as part of my role as manager I had set the direction of how to use those products in sales. Thus I became more involved with that side of the business, and exploring how we can build a better product for sales reps to sell more effectively using video. I brought it up casually to one of our PMs thinking it would be something I work on maybe a year or two from now, but they just asked me to do it now so I just took the plunge.",
                  }
                ]
              }
            ]
            )
Story.create(name: "Nicolle Quintero", location: "New York, NY",
            linkedin_url: "https://www.linkedin.com/in/nicollequintero", ini_age: 29, sub_age: 35,
            ini_title: "Advertising Sales Manager", ini_career_path: "Sales",
            ini_industry: "Technology, Digital Advertising", ini_company: "Facebook",
            ini_company_type: "Start-Up", sumary: "• Had a lack of passion for advertising sales, engineering was a childhood interest\nthat grew through the years\n• Overcame mental barrier around financial opportunity cost of leaving existing career\nby understanding that she would not end up in a financially tough situation\nregardless, and that gaining marketable skills will always be valuable\n• Managed fears of failure by considering - “what would you do if you weren’t\nafraid?”\n• Initially gained software development skills primarily through a bootcamp, but then\nalso had a very supportive mentor at her first job that taught her a lot\n• Landed her first job even without necessarily 100% of the skills, by showing she\nhad 100% of the dedication, passion and willingness to learn",
            vanity_url: "", quote: "", education: "UCLA",
            careers_attributes: [
              {
                name: "Software Development",
                title: "Software Developer",
                industry: "Technology, Freelance",
                company: "CB Insights, freelance",
                company_type: "Start-Up, Freelance",
                precedent_career: "Initial",
                story_questions_attributes: [
                  {
                    question: "What was your big break?",
                    response: "I really lucked out in that was accepted into this website Hired after putting my resume up, and so I had employers coming to me to give me offers. I had a few people reach out, one of the people I spoke with was a co-founder of the company. I was lucky because he and his other co-founder took a gamble on me. They saw someone that was hungry and willing to learn, and may not have had 100% of the skills they were looking for, but had faith I could learn it. I was the only engineer that didn’t have a computer science degree even after leaving the job two years later, but was still able to hold my own. I was lucky in that I found someone who was willing to take a “risk” on me, which was similar to how I got my first job. They weren’t looking for someone with 100% the skills, but 100% of the dedication, passion and willingness to learn. That all happened very quickly, I got the job offer a month after finishing bootcamp even though they usually say to prepare for six months of job hunting. I had a lot of peers who did spend that much time or even longer getting a job so I was incredibly lucky.",
                  },
                  {
                    question: "What was it like starting in the new career?",
                    response: "It was a rollercoaster and still continues to be one because of my imposter syndrome. I got the job but I felt like… oh my god they hired the wrong person. It was really tough at first, I learned Ruby in bootcamp but had to learn a completely new language, Go, on the job. I felt like there’s a lot to learn here and I’m not smart enough. That was one of the biggest challenges and continues to be a challenge. Now I have some coping mechanisms, where I would reflect objectively back on projects I did that were hard but I was able to do it, helping myself see that I was continuously succeeding helped me feel less like an imposter and know that I just needed to believe in myself. When new engineers joined my company and I saw them struggle too, I realized a lot of things I struggled with was just cause I was new.",
                  },
                  {
                    question: "What was involved with learning a new coding language?",
                    response: "I did a good amount of learning online, but the biggest help was that I had one mentor at my company who was a great teacher and non-judgemental. He made me feel okay asking questions and gave as much time to me as I needed. It was especially helpful for me in that phase where I was new and not as confident, as he gave me faith and a nurturing environment.",
                  },
                  {
                    question: "What are you up to now?",
                    response: "I left my job earlier this year and was just focusing on life, and working on projects and freelancing. I just launched an app a month ago and it was imposter syndrome all over as I built it with crazy ups and downs. One day I would feel like I was the stupidest person on earth and would need to refund the client, and then a few weeks later I’d solve those problems and feel like I’m the smartest person ever. I learned a lot skills wise but also about myself in terms of what I enjoy doing. I’m also currently exploring changing my career another time into product management, as it seems like the natural bridge between my past two careers. Also, having worked closely with product managers and knowing I could use all my left and right brain skills is exciting.",
                  },
                  {
                    question: "How did you initially decide to go into ad sales?",
                    response: "It was completely out of procrastination and luck. In my senior year in college, a lot of people had jobs lined up with places like consulting firms. By the second semester in the spring, I was starting to think “everyone else has a job, what’s wrong with me?”, and then I see a poster for Google who will be coming to recruit and I decide to check it out since I thought it was a cool company. The people that came were really energetic and passionate about the company, and so I decided to look into it and applied to two entry level positions - one in HR and one in advertising sales. I interviewed for both and got offers for both. I ended up choosing advertising sales cause the role was in Michigan which is closer to my home state of Connecticut. During the process, Google was up-front about the fact that they did not care what you majored in and that you didn’t need to have any experience. They were just looking for smart people to train. Overall, I really just happened upon it cause I was looking for a job that seemed fun and they were willing to train me. After a year at Google I wanted to come back to the east coast, and ended up finding another advertising sales job at Facebook that I progressed in.",
                  },
                  {
                    question: "How did you realize you wanted to change?",
                    response: "I really enjoyed the companies and people I worked with, but never really had or developed a passion for the industry [advertising sales] in itself. That was the number one thing. After doing it for several years and getting a little older into quarter-life crisis mode, I started reflecting on what I really want to contribute to the world. I realized I happened into this, and was incredibly lucky, but was not something I had a deep passion for. I realized I wasn’t getting any fulfillment out of making rich brands richer. I felt like I should be doing something more, and so that was that seed of “This is good for now… but it’s not what you’re going to be doing for the rest of your life.” Towards the end, when I was ready to make the change it was more about just getting bored. I wasn’t giving 100% of my effort anymore but was still getting commended, which is an awesome position to be in but for someone like me I need to be a little stressed and challenged or else I just get bored. That was the tipping of knowing something had to change.",
                  },
                  {
                    question: "How did you decide what you wanted to change into?",
                    response: "A part of my job that I wasn’t bored about was product launches where I worked crossfunctionally with product managers and engineers. I really enjoyed that, and one of the things I enjoyed the most was interacting with the engineers cause they made everything work but in sales you had no idea how they did that. There was this allure and fascination around them. Through these interactions I was reminded I enjoyed computer science way back in high school too, and that seeded my desire to be an engineer myself. This was also a time when development bootcamps were starting and so as my interest grew I started looking up bootcamps in New York. Then that’s when I started developing an exit strategy.",
                  },
                  {
                    question: "What factors held you back from changing and how did you overcome them?",
                    response: "It was just the fact that I had a great job, where I made great money, around people I really enjoyed working with. I feel like for a lot of people who change careers money is a big motivation, but for me money was not a motivation at all, in fact I’d actually probably lose out on a lot leaving one of the best companies in world. And so I questioned does it actually make sense and is it a financially smart move. That was huge. I grew up not having wealth either, so for the first time I was doing well compared to anyone in the family had ever had and it was hard to give that up. Getting over this was really just a conversation with myself, which I still have, around how money is not everything and thinking about mo’ money mo’ problems. I thought to myself about how you are incredibly privileged and lucky, and you will not end up back to being poor if you’re smart about it. I thought to myself that learning to code is not a dumb thing, even if I go down in salary, long-term this is a really useful life skill to have so I can take the L for right now… knowing that bigger picture it makes sense and will work out fine. Then there was the fear of - can I actually do this? I would have to start from the beginning in my early thirties and I wondered am I just too old to learn all this now. There was also a fear around women and people of colour. I wondered do I want to go into a field where there aren’t going to be many people that look like me? And if I don’t succeed, am I proving that minorities can’t do this. It took a while for me to convince myself to do it. To get over these fears, as cheesy as it sounds - Facebook has the mantra “What would you do if you weren’t afraid?”, and for well over a year I just I kept asking myself that. The resounding answer was if you didn’t have these fears you would just do it. You would go and see if you can be this thing that you wanted to be when you were younger. I was also volunteering with this organization Black Girls Code, where I saw these young girls being inspired and genuinely believing they could be whatever they wanted to be. Then I started thinking why can’t I think that about me. That was a huge motivating factor, and then it was just daring myself to do what I want to do.",
                  },
                  {
                    question: "What advice would you give to others who want to switch into Software Engineering?",
                    response: "I feel that there’s been a lot of buzz around going into software engineering but I think some people are just going to naturally be better at it and get more fulfillment out of learning it. The first thing is to just take a few courses and tutorials and figure out if you have a knack for it, instead of diving in and thinking you have to do this. Also, talking to people in the job currently will help you with understanding what it means and what it looks like to actually do it. You want to hear about what their experiences are really like, and it can differ a lot between different engineers. I would also say, have that conversations with yourself around how you learn best. Ask yourself am I good at being self-motivated in which case you can do things online, or are you more like me where I find it hard to keep focused in which case you may need a structured classroom setting to guide you. Finally, just work on building your portfolio. Always, always, always be coding or else you’ll lose it. I can’t code in Ruby at all anymore cause I stopped coding in it. Of course I can pick it up again but I don’t have it right now cause I let it go.",
                  }
                ]
              }
            ]
            )

## Categories
Category.create( name: "Career Path", description: "Sales|Accountant|Product Manager|Software Development|Business, Finances")
Category.create( name: "Title", description: "Sales Development Manager|Associate Product Manager|Software Developer|Salesman|Advertising Sales Manager|Senior Accountant")
Category.create( name: "Industry", description: "Technology|Social Media|IT|Construction|Technology, Digital Advertising|Professional Services")



