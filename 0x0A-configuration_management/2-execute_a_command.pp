# kill process killmenow

exec { 'pkill':
  command => 'pkill lillmenow',
provider => 'shell'
}
