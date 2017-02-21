require 'octokit'
#github = Goithub.new
#Github.repos.list user: 'simp'
# Provide authentication credentials
# client = Octokit::Client.new(:login => 'myid', :password=> 'nottellinya')
client = Octokit::Client.new(:access_token => '66605921ef4c3TEST03b61046ebebf82ae7923666')
# Fetch the current user
# puts client.user.name
# now list all the simp repos
repos = Octokit.repositories("simp", {sort: :pushed_at})

# list descriptions
repocount = 0
repos.each do |repo|
  repocount += 1
  puts "[.#{repo.name}]"
  fullreponame = "simp/#{repo.name}"
  puts "#{fullreponame} -- Count #{repocount} Description : #{repo.description} #{repo.created_at} Updated at  : #{repo.updated_at}"
  prcount = 0
  pullreqs = Octokit.pulls(fullreponame, :state => 'closed')
#  range doesnt work yet  pullreqs = Octokit.pulls(fullreponame, :state => 'closed', :closed => '2015-08-01..2015-09-01')
  pullreqs.each do |pr|
    prcount += 1
    puts "prcount #{prcount} PR: #{pr.title} Closed: #{pr.closed_at}"
  end
end
#
