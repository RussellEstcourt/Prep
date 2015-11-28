<!--- Form to retieve requested Contact ID --->
<cfform method="post">
  Contact Id:
  <cfinput type="text" name="cid" validate="integer" message="Please enter a numeric value!">
  <input type="submit" value="Get">
  (Enter 1 or 2 to retrieve a contact)
</cfform>
<cfoutput>
  <!--- If we have an incoming ID create a web service
  		object and attempt to get contact information.  --->
  <cfif isdefined("form.cid") and len(form.cid) GT 0>
    <!--- Adjust the below variables for your test if necessary --->
    <cfset wshost = cgi.http_host>
    <cfset wserv = "contact.cfc">
    <!--- Create web service object and make a call to retrieve a contact --->
    <cfscript>
		ws = CreateObject("webservice", "http://#wshost#/prep/test/#wserv#?wsdl");
		wscontact = ws.getContactByPrimaryKey(#form.cid#);
	</cfscript>
    <!--- Display return code and message --->
    Result properties using properties on the extended component (basecomp.cfc):<br>
    Return Code: #wscontact.getreturncode()#<br>
    Message: #wscontact.getreturnmessage()#<br>
    <br>
    <!--- Display Contact information if one was found --->
    <cfif #wscontact.getreturncode()# GT 0>
      <!--- Use the automatically created Get Method to retrieve properties --->
      Contact Information:<br>
      #wscontact.getFirstname()# #wscontact.getlastname()# <br>
      Phone: #wscontact.getPhone()#<br>
      Address: #wscontact.getAddress()# #wscontact.getCity()#,#wscontact.getState()# #wscontact.getZip()# #wscontact.getCountry()# <br>
      <br>
    </cfif>
    <!--- Dump the returned Contact component --->
    Object Definitions: Notice the automatically created get and set methods
    for each cfproperty value<br>
    <cfdump var="#wscontact#">
    <br>
  </cfif>
</cfoutput>