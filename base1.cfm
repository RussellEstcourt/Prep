<!--- <cfset objGreeting =createobject('component', 'greetings') /> --->

<!--- <cfset objGreeting =createobject('component', 'contacts').init(datasource="projectTracker") /> --->

<cfscript>
	//create the object
	objGreeting=new greetings();

	objProjects = new contacts();

	objPerson = new person();

</cfscript>

<cfinvoke component="greetings" method="sayHello" returnvariable="strHello" />

<cfoutput>#strHello#</cfoutput>

<cfoutput>#objGreeting.sayHello()#</cfoutput>

<!--- <cfset objGreeting =createobject('component', 'greetings') />

<cfoutput>#objGreeting.getName()#</cfoutput> --->

<cfoutput>#objGreeting.getName2(url.firstname, url.lastname)#</cfoutput>

<cfoutput>#objGreeting.personalisedGreeting(url.firstname, url.lastname)#</cfoutput>

<cfoutput>#objGreeting.personalisedGreeting(firstname=url.firstname, lastname=url.lastname)#</cfoutput>

<!--- <cfoutput>#objProjects.getCurrentdate()#</cfoutput> --->

<cfoutput>#objPerson.init()#</cfoutput>