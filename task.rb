require 'date'
require 'open-uri'
require 'zlib'
require 'yajl'
require 'mongo'
require 'bson'

include Mongo

def launchTask(date, heure)
	puts 'Date non formatee : ' + date
	puts 'Heure : ' + heure
	puts 'Date formatee : ' + formatDate(date)
	connectToDatabase
	retrieveGithubEvents(formatDate(date), heure)
end

def formatDate(aDate)
 
  date = DateTime.parse(aDate)
  return date.strftime('%Y') + '-' + date.strftime('%m') + '-' + date.strftime('%d')
 
 end
 
def connectToDatabase
	puts "Connection a la base de donnees.."
	@db = MongoClient.new("ds049661.mongolab.com", 49661).db("dashboard-de-ouf")
	@db.authenticate("team", "team")
	
	puts "Connecte a la base de donnee : dashboard-de-ouf"
end
 
def retrieveGithubEvents(formatedDate, heure)
	puts 'Telechargement de : ' + 'http://data.githubarchive.org/' + formatedDate + '-' + heure + '.json.gz...'
	gz = open('http://data.githubarchive.org/' + formatedDate + '-' + heure + '.json.gz')
	js = Zlib::GzipReader.new(gz).read
	 
	events = @db.collection("Events")
	
	puts 'Recuperation des evenements en cours..'
	
	Yajl::Parser.parse(js) do |event|
		events.insert(event)
	end
	
	puts 'Recuperation des evenements terminee'
end

launchTask(ARGV[0], ARGV[1])