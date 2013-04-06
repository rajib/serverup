$(document).ready(function() {
				$('#table_already_added_contacts').dataTable( {
					"sPaginationType": "bootstrap",
					"oLanguage": {
						"sLengthMenu": "_MENU_ records per page"
					},
					"aaSorting": [],
					"bPaginate": false,
					"bInfo": false
				} );
			} );
