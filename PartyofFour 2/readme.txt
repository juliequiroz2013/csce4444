Julie Quiroz, Justin Durko, Travis Allan
Part 4

This project is run on NetBeans 8.0.2

Due to database restrictions, this file can only be viewed through a machine that already has the PartyofFour database and server connections linked to the NetBeans application. 

Within the 'web' folder, the index, web views, and the web images are placed here.

The 'party of four directory' screenshot shows the directory of how the NetBeans was set up.

Web pages - 
    WEB-INF 
        jspf
            contained header and footer automatically added to each page
        view
            cart - everything on the cart is shown to the customer
            category - shows the menu items
            checkout - asks for a name, and sends the cart items to the kitchen
            confirmation - confims to the user that the items have been sent to the                 kitchen
        web.xml - provides shotcuts to automatically view header and footer to each             page
        img - contains all image files
        test - has table grid of all products in the database
        index.jsp - the homepage
Source Packages - manages all capabilities run on the background of the application
    cart - manages cart capabilities
    entity - manages individual database tables in order to be accessed by the              others
    session - manages the entities individually
    


Part4.docx contains the unit tests and validation tests