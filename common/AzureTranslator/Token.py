import urllib
import urllib2
import json

import os
import sys
import os.path
import datetime

from AccessInfo import AccessInfo

class Token:

	StoredTokenPath = os.path.join(os.path.abspath(os.path.dirname(__file__)), 'stored-token.txt')

	@staticmethod
	def get():
		if Token.__isTooOld():
			return Token.__fromServer()
		else:
			return Token.__fromStored()

	@staticmethod
	def __isTooOld():
		last = Token.__getLastUpdateAt()
		now = Token.__getNow()

		diff = (now - last).total_seconds()
		return 600 < diff 

	@staticmethod
	def __getLastUpdateAt():
		last = os.stat(Token.StoredTokenPath).st_mtime
		return datetime.datetime.fromtimestamp(last)

	@staticmethod
	def __getNow():
		return datetime.datetime.today()

	@staticmethod
	def __fromServer():
		params = urllib.urlencode(AccessInfo.Token.Params)
		request = urllib2.Request(AccessInfo.Token.Url, params)

		try:
			response = urllib2.urlopen(request, timeout = 3)

		except Exception as e:
			print 'token connection error'
			sys.exit()

		jsonData = json.loads(response.read())

		token = jsonData[AccessInfo.Token.Key]

		Token.__store(token)

		return token

	@staticmethod
	def __fromStored():
		_file = open(Token.StoredTokenPath, 'r')

		return _file.readline()

	@staticmethod
	def __store(token):
		_file = open(Token.StoredTokenPath, 'w')

		_file.write(token)
		_file.close()
