Coffeescript-PBNM
=================

A Coffeescript Policy Based Network Management System.

This is the evolution of a XACML compliant system originally authored in Javascript. The traditional approach of XACML 
is a blocking implementation (Java) with XML inputs for requests which look up XML policies. A research paper was driven
by the design of a non blocking implementation with the main components authored in Javascript. The inputs this time
were JSON documents instead of XML for a more fluid, friction free approach to policy based management.

The public JSONPL repository
https://github.com/lgriffin/JSONPL
shows a version of some of the components and the request styles. An internal version will show the source code of
the PDP when it is cleaned up and a bit more presentatble. 

This work saw the XML documents converted manually into Coffeescript requests, retaining the semantics encoded.
As Coffeescript is a "Turing Complete" language it means that any algorithm computationally possible 
can be encoded as a request or policy. XML or JSON as a data representation cannot encode such features. Additionally,
the policies and requests can become more domain aware, meaning the PDP decision tree can be reduced.

This software is considered beta at the moment and is a work in progress.

Any questions or queries please email me on lgriffin@tssg.org
Suggestions and improvements would be appreciated.

Leigh. 26-Jun-2012
