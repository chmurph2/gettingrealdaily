#!/usr/bin/env ruby

require 'rubygems'
require 'builder'
require 'active_support'
require 'haml'
require 'sass'

GRD_DOMAIN = "gettingrealdaily.com"
GR37S_DOMAIN = "gettingreal.37signals.com"
SITE_NAME = "Getting Real (daily)"

def essays
  [["Introduction (Chapter 1): What is Getting Real?", "ch01_What_is_Getting_Real.php"], ["Introduction (Chapter 1): About 37signals", "ch01_About_37signals.php"], ["Introduction (Chapter 1): Caveats, disclaimers, and other preemptive strikes", "ch01_Caveats_disclaimers_and_other_preemptive_strikes.php"], ["The Starting Line (Chapter 2): Build Less", "ch02_Build_Less.php"], ["The Starting Line (Chapter 2): What's Your Problem?", "ch02_Whats_Your_Problem.php"], ["The Starting Line (Chapter 2): Fund Yourself", "ch02_Fund_Yourself.php"], ["The Starting Line (Chapter 2): Fix Time and Budget, Flex Scope", "ch02_Fix_Time_and_Budget_Flex_Scope.php"], ["The Starting Line (Chapter 2): Have an Enemy", "ch02_Have_an_Enemy.php"], ["The Starting Line (Chapter 2): It Shouldn't be a Chore", "ch02_It_Shouldnt_be_a_Chore.php"], ["Stay Lean (Chapter 3): Less Mass", "ch03_Less_Mass.php"], ["Stay Lean (Chapter 3): Lower Your Cost of Change", "ch03_Lower_Your_Cost_of_Change.php"], ["Stay Lean (Chapter 3): The Three Musketeers", "ch03_The_Three_Musketeers.php"], ["Stay Lean (Chapter 3): Embrace Constraints", "ch03_Embrace_Constraints.php"], ["Stay Lean (Chapter 3): Be Yourself", "ch03_Be_Yourself.php"], ["Priorities (Chapter 4): What's the big idea?", "ch04_Whats_the_Big_Idea.php"], ["Priorities (Chapter 4): Ignore Details Early On", "ch04_Ignore_Details_Early_On.php"], ["Priorities (Chapter 4): It's a Problem When It's a Problem", "ch04_Its_a_Problem_When_Its_a_Problem.php"], ["Priorities (Chapter 4): Hire the Right Customers", "ch04_Hire_the_Right_Customers.php"], ["Priorities (Chapter 4): Scale Later", "ch04_Scale_Later.php"], ["Priorities (Chapter 4): Make Opinionated Software", "ch04_Make_Opinionated_Software.php"], ["Feature Selection (Chapter 5): Half, Not Half-Assed", "ch05_Half_Not_Half_Assed.php"], ["Feature Selection (Chapter 5): It Just Doesn't Matter", "ch05_It_Just_Doesnt_Matter.php"], ["Feature Selection (Chapter 5): Start With No", "ch05_Start_With_No.php"], ["Feature Selection (Chapter 5): Hidden Costs", "ch05_Hidden_Costs.php"], ["Feature Selection (Chapter 5): Can You Handle It?", "ch05_Can_You_Handle_It.php"], ["Feature Selection (Chapter 5): Human Solutions", "ch05_Human_Solutions.php"], ["Feature Selection (Chapter 5): Forget Feature Requests", "ch05_Forget_Feature_Requests.php"], ["Feature Selection (Chapter 5): Hold the Mayo", "ch05_Hold_the_Mayo.php"], ["Process (Chapter 6): Race to Running Software", "ch06_Race_to_Running_Software.php"], ["Process (Chapter 6): Rinse and Repeat", "ch06_Rinse_and_Repeat.php"], ["Process (Chapter 6): From Idea to Implementation", "ch06_From_Idea_to_Implementation.php"], ["Process (Chapter 6): Avoid Preferences", "ch06_Avoid_Preferences.php"], ["Process (Chapter 6): \"Done!\"", "ch06_Done.php"], ["Process (Chapter 6): Test in the Wild", "ch06_Test_in_the_Wild.php"], ["Process (Chapter 6): Shrink Your Time", "ch06_Shrink_Your_Time.php"], ["The Organization (Chapter 7): Unity", "ch07_Unity.php"], ["The Organization (Chapter 7): Alone Time", "ch07_Alone_Time.php"], ["The Organization (Chapter 7): Meetings Are Toxic", "ch07_Meetings_Are_Toxic.php"], ["The Organization (Chapter 7): Seek and Celebrate Small Victories", "ch07_Seek_and_Celebrate_Small_Victories.php"], ["Staffing (Chapter 8): Hire Less and Hire Later", "ch08_Hire_Less_and_Hire_Later.php"], ["Staffing (Chapter 8): Kick the Tires", "ch08_Kick_the_Tires.php"], ["Staffing (Chapter 8): Actions, Not Words", "ch08_Actions_Not_Words.php"], ["Staffing (Chapter 8): Get Well Rounded Individuals", "ch08_Get_Well_Rounded_Individuals.php"], ["Staffing (Chapter 8): You Can't Fake Enthusiasm", "ch08_You_Cant_Fake_Enthusiasm.php"], ["Staffing (Chapter 8): Wordsmiths", "ch08_Wordsmiths.php"], ["Interface Design (Chapter 9): Interface First", "ch09_Interface_First.php"], ["Interface Design (Chapter 9): Epicenter Design", "ch09_Epicenter_Design.php"], ["Interface Design (Chapter 9): Three State Solution", "ch09_Three_State_Solution.php"], ["Interface Design (Chapter 9): The Blank Slate", "ch09_The_Blank_Slate.php"], ["Interface Design (Chapter 9): Get Defensive", "ch09_Get_Defensive.php"], ["Interface Design (Chapter 9): Context Over Consistency", "ch09_Context_Over_Consistency.php"], ["Interface Design (Chapter 9): Copywriting is Interface Design", "ch09_Copywriting_is_Interface_Design.php"], ["Interface Design (Chapter 9): One Interface", "ch09_One_Interface.php"], ["Code (Chapter 10): Less Software", "ch10_Less_Software.php"], ["Code (Chapter 10): Optimize for Happiness", "ch10_Optimize_for_Happiness.php"], ["Code (Chapter 10): Code Speaks", "ch10_Code_Speaks.php"], ["Code (Chapter 10): Manage Debt", "ch10_Manage_Debt.php"], ["Code (Chapter 10): Open Doors", "ch10_Open_Doors.php"], ["Words (Chapter 11): There's Nothing Functional about a Functional Spec", "ch11_Theres_Nothing_Functional_about_a_Functional_Spec.php"], ["Words (Chapter 11): Don't Do Dead Documents", "ch11_Dont_Do_Dead_Documents.php"], ["Words (Chapter 11): Tell Me a Quick Story", "ch11_Tell_Me_a_Quick_Story.php"], ["Words (Chapter 11): Use Real Words", "ch11_Use_Real_Words.php"], ["Words (Chapter 11): Personify Your Product", "ch11_Personify_Your_Product.php"], ["Pricing and Signup (Chapter 12): Free Samples", "ch12_Free_Samples.php"], ["Pricing and Signup (Chapter 12): Easy On, Easy Off", "ch12_Easy_On_Easy_Off.php"], ["Pricing and Signup (Chapter 12): Silly Rabbit, Tricks are for Kids", "ch12_Silly_Rabbit_Tricks_are_for_Kids.php"], ["Pricing and Signup (Chapter 12): A Softer Bullet", "ch12_A_Softer_Bullet.php"], ["Promotion (Chapter 13): Hollywood Launch", "ch13_Hollywood_Launch.php"], ["Promotion (Chapter 13): A Powerful Promo Site", "ch13_A_Powerful_Promo_Site.php"], ["Promotion (Chapter 13): Ride the Blog Wave", "ch13_Ride_the_Blog_Wave.php"], ["Promotion (Chapter 13): Solicit Early", "ch13_Solicit_Early.php"], ["Promotion (Chapter 13): Promote Through Education", "ch13_Promote_Through_Education.php"], ["Promotion (Chapter 13): Feature Food", "ch13_Feature_Food.php"], ["Promotion (Chapter 13): Track Your Logs", "ch13_Track_Your_Logs.php"], ["Promotion (Chapter 13): Inline Upsell", "ch13_Inline_Upsell.php"], ["Promotion (Chapter 13): Name Hook", "ch13_Name_Hook.php"], ["Support (Chapter 14): Feel The Pain", "ch14_Feel_The_Pain.php"], ["Support (Chapter 14): Zero Training", "ch14_Zero_Training.php"], ["Support (Chapter 14): Answer Quick", "ch14_Answer_Quick.php"], ["Support (Chapter 14): Tough Love", "ch14_Tough_Love.php"], ["Support (Chapter 14): In Fine Forum", "ch14_In_Fine_Forum.php"], ["Support (Chapter 14): Publicize Your Screwups", "ch14_Publicize_Your_Screwups.php"], ["Post-Launch (Chapter 15): One Month Tuneup", "ch15_One_Month_Tuneup.php"], ["Post-Launch (Chapter 15): Keep the Posts Coming", "ch15_Keep_the_Posts_Coming.php"], ["Post-Launch (Chapter 15): Better, Not Beta", "ch15_Better_Not_Beta.php"], ["Post-Launch (Chapter 15): All Bugs Are Not Created Equal", "ch15_All_Bugs_Are_Not_Created_Equal.php"], ["Post-Launch (Chapter 15): Ride Out the Storm", "ch15_Ride_Out_the_Storm.php"], ["Post-Launch (Chapter 15): Keep Up With the Joneses", "ch15_Keep_Up_With_the_Joneses.php"], ["Post-Launch (Chapter 15): Beware the Bloat Monster", "ch15_Beware_the_Bloat_Monster.php"], ["Post-Launch (Chapter 15): Go With the Flow", "ch15_Go_With_the_Flow.php"], ["Conclusion (Chapter 16): Start Your Engines", "ch16_Start_Your_Engines.php"]]
end

def calculate_essay_index
  launch_date = Date.new(2009, 02, 23).to_time.to_i
  (Date.today.to_time.to_i - launch_date) / 1.day.to_i % essays.length
end

def write_atom_feed(essay_index)
  essay_title = essays[essay_index][0]
  essay_uri = essays[essay_index][1]
  now = Time.now.xmlschema

  File.open("atom.xml", "w") do |file|
    xml = Builder::XmlMarkup.new(:target => file, :indent => 2)
    xml.instruct!
    xml.feed "xml:lang" => "en-US", :xmlns => "http://www.w3.org/2005/Atom" do
      xml.id "tag:#{GRD_DOMAIN},2005:/"
      xml.link :type => "text/html", :href => "http://#{GR37S_DOMAIN}", :rel => "alternate"
      xml.link :type => "application/atom+xml", :href => "http://#{GRD_DOMAIN}/atom.xml", :rel => "self"
      xml.title SITE_NAME
      xml.updated now
      xml.entry do
        xml.id "tag:#{GRD_DOMAIN},2005:/#{essay_uri}?#{Time.now.strftime("%Y%m%d")}"
        xml.published now
        xml.updated now
        xml.link :type => "text/html", :href => "http://#{GR37S_DOMAIN}/#{essay_uri}", :rel => "alternate"
        xml.title essay_title
        xml.author { xml.name "37signals" }
        xml.content :type => "text/html", :mode => "escaped" do
          xml.cdata!(%{<iframe width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" src="http://#{GR37S_DOMAIN}/#{essay_uri}"></iframe>})
        end
      end
    end
  end
end

def write_index(essay_index)
  essay_uri = essays[essay_index][1]
  index_as_haml = <<-EOF
!!! 1.1
%html{ "xml:lang" => "en", :lang => "en", :xmlns => "http://www.w3.org/1999/xhtml" }
%head
  %title
    #{SITE_NAME}
  %link{ :href => "http://feeds2.feedburner.com/GettingRealDaily", :title => "#{SITE_NAME}", :rel => "alternate", :type => "application/atom+xml" }
  %style{ :type => "text/css" }
    :sass
      body
        :font-family georgia
        :margin-top 20px
        :margin 0
        :padding 0

      #header
        :padding 0 10px

      h2
        :padding-top 10px
        :font-size 30
        :font-style italic
        :display inline

      #atom
        :float right
        :margin-right 48%
        :background transparent url(rss.gif) no-repeat scroll 50% 0
        :height 70px
        :width 48px
        a
          :display block
          :height 48px
          :margin 0 auto
          :width 48px

      iframe
        :position absolute
        :margin 0
        :padding 0
        :border 0
        :border-top 1px solid black
        :border-bottom 1px solid black
        :left 0px
        :bottom 40px
        :height 80%
        :width 100%

      #footer
        :text-align center
        :width 100%
        :position absolute
        :bottom 0px
        :font-size 11px
        :padding-bottom 13px
        :color #000
        :font-family verdana
        a
          :color #000
          &:hover
            :background-color #000
            :color #FFF
%body
  %p#atom
    %a{ :href => "http://feeds2.feedburner.com/GettingRealDaily", :title => "Subscribe to the feed", :alt => "atom icon" }
  %br
  #header
    %h2
      #{SITE_NAME}
    %h3
      Today's essay is...
  %iframe{ :src => "http://#{GR37S_DOMAIN}/#{essay_uri}" }
  #footer
    #{SITE_NAME} was created by
    %a{ :href => "http://blogobaggins.com" }
      Christopher R. Murphy
    It is not in any way affiliated with
    %a{ :href => "http://37signals.com" }
      37signals, LLC
    or
    %a{ :href => "http://gettingreal.37signals.com/" }
      Getting Real
  %script{ :type => "text/javascript" }
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
  %script{ :type => "text/javascript" }
    try {
    var pageTracker = _gat._getTracker("UA-7577733-1");
    pageTracker._trackPageview();
    } catch(err) {}
EOF

  html = Haml::Engine.new(index_as_haml).render
  File.open("index.html", "w") do |file|
    file << html
  end
end

FileUtils.cd(File.dirname(__FILE__))
essay_index = calculate_essay_index
write_atom_feed(essay_index)
write_index(essay_index)