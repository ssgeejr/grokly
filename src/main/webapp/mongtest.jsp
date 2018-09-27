
<%@ page 
	language="java"
	contentType="text/html; 
    charset=windows-1256"
	pageEncoding="windows-1256" 
	import="com.mongodb.BasicDBObject"
	import="com.mongodb.DB" 
	import="com.mongodb.DBCollection"
	import="com.mongodb.DBCursor" 
	import="com.mongodb.MongoClient"
	import="java.net.UnknownHostException"
	import="java.util.Date"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>MongoDB Test Page</title>
</head>
<body>



	<%
		MongoClient mongoClient = null;
		try {
//			mongoClient = new MongoClient();
//			mongoClient = new MongoClient("gorkly", 27017);
			mongoClient = new MongoClient("gorkly");
			// or, to connect to a replica set, supply a seed list of members
			//MongoClient mongoClient = new MongoClient(Arrays.asList(new ServerAddress("localhost", 27017),
			//                                    new ServerAddress("localhost", 27018),
			//                                  new ServerAddress("localhost", 27019)));
	
			DB db = mongoClient.getDB("grokly");
			DBCollection coll = db.getCollection("links");
			BasicDBObject newURL = new BasicDBObject("ip", "127.0.0.1").append("user", "fake-user").append("timestamp", new Date());
			newURL.append("title","fake-title").append("description","fake-title").append("url","fake-title").append("tags","fake-title");
	
			//System.out.println("Data Display");
			coll.insert(newURL);
			DBCursor cursor = coll.find();
			try {
				while (cursor.hasNext()) {
					System.out.println(cursor.next());
				}
			} finally {
				//mongoClient.dropDatabase("test");
			}
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	%>
</body>
</html>