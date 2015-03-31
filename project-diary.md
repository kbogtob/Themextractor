#Project diary

## Daily log
### 1st day (26/03):
On this first day, I got the project statement (and decrypted it) and I've made some quick specs about it. I thought of the site template and made a mockup using balsamiq.

Then, I worked my brain out on the logic. I looked for as much information that I could on this kind of problems and on the API's that I have to use.

About **Textrazor**, I did some online and REST tests using curl. The API is pretty useful for its named entity recognition. It works pretty well. But we can't say that about the topics labeling. It's way too much inaccurate, many of the resulted topics have a high relevancy score. So I chose to use this API only for the named entity recognition and Aymeric confirmed this first intent.

I started to look at **DBpedia** and its various usages. I first thought of using the abstract tag on an entity and parse it with Textrazor in order to improve its first results. But that's really not a well designed solution.

I found some pointers around something called _Graph-based topic labeling_ using DBpedia.

### 2nd day (27/03):
On this second day, I translated the mockup into an html page. I then prepared the sinatra web application and translated the html into a haml template and its sass file.

Then, I looked for information and pointers about the Graph-based topic labeling. I found a research paper [1] about it using DBpedia. It's pretty interesting but sadly the paper is incomplete in the way how to get a final solution. But, a positive point, their result is the Canopy (kanopy) framework [2]. So I looked for it and surprisingly, it was doing exatly what I need to do. But there's no source code and no specific model to get some clues.

Moreover, I found similar applications like Wikiminer [3] or the Maui indexer which is the result of a PhD. The source code is available but their code base is a bit large to be studied deeply. It's still some good clues.

My brain filled with these new knowledges, I'm still hesitating between using the dbpedia directly (Spaql endpoint [4]) thus building the concept graph using the Ruby Graph Library (gem); and using a pre-made library.

Finally, I finished on doing the UML design diagram of the webapp. It includes the use of the textrazor API. But not the use of the DBpedia API. I'm thinking of using a small C++ application for this in order to stay perf-wise.

###### 3rd day & 4th day (28-29/03): I was moving and I was way too tired to produce anything. But still thinking about solutions

### 5th day (30/03):
On this day, I finished my moving and worked on the text razor API. I build the client I had in mind using the textrazor gem as an inspiration. I tested it simply and moved on the dbpedia side. I documented myself on how it works and on how a sparql endpoint can be used. As I have only a short time, I thought of making one simple generic query to use the endpoint and fetch the data we need.

### 6th day (31/03):
Yesterday, I'm going forward on my usage of dbpedia to build an oriented knowledge graph and using the paper [1] to weight the nodes and select the concepts. As I have only a little time remaining, I'll try a ruby implementation instead of a C++ implementation. I may still be able to change my mind if it's way too slow.

I wrote one simple DBpedia client using the RDF Sparql client and tried to get the data to build the graph in a simple testcode file.

I developed the brain/business logic part using the ruby graph library (so I can view the graphs while debugging) and dbpedia to fill them. I'm working on the focused closeness centrality calculation right now.

I'm getting problems with special characters on the sparql endpoint. Problems which I don't experience on the "website" sparql virtuoso endpoint. (e.g. With the ç of François Hollande, it's finding results on the website but not through the API) I decided to avoid this problem right now to focus on the business logic.

## Sources
* [1] - "Unsupervised Graph-based Topic Labelling using DBpedia" by Ioana Hulpus, Conor Hayes, Marcel Karnstedt, Derek Greene - Digital Enterprise Research Institute & University College Dublin - Found at  http://aran.library.nuigalway.ie/xmlui/bitstream/handle/10379/4528/wsdm_noCopyright.pdf?sequence=1
* [2] - WikipediaMiner - Toolkit for tapping the rich semantics encoded within Wikipedia by the University of Waikato - Found at http://wikipedia-miner.cms.waikato.ac.nz/
* [3] - Maui - Multi-purpose automatic topic indexing by Alyona Medelyan - University of Waikato - Found at https://code.google.com/p/maui-indexer/
* [4] - DBpedia Virtuoso Sparql endpoint - Found at http://dbpedia.org/sparql
