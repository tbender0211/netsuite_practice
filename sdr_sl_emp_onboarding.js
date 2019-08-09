/**
 * @NApiVersion 2.x
 * @NScriptType Suitelet
 */

 define(["N/email", "N/record", "N/redirect", "N/ui/serverWidget"],
    function (email, record, redirect, serverWidget) {

        function onRequest(context) {

            var request = context.request;
            var response = context.response;

            if (request.method == "GET") {
                var form = serverWidget.createForm({
                    title : "Employee On-boarding"
                });

                //Field groups
                var empInfo = form.addFieldGroup({
                    id : "empinfoid",
                    label : "Employee Information"
                });

                var supMeeting = form.addFieldGroup({
                    id : "supmeetid",
                    label : "Meeting with Supervisor"
                });

                var emailWelcome = form.addFieldGroup({
                    id : "welcemailid",
                    label : "Welcome Email"
                });
                

                //Fields for employee info field group
                var firstNameFld = form.addField({
                    id : "custpage_first_name_fld",
                    type : serverWidget.FieldType.TEXT,
                    label : "First Name",
                    container : "empinfoid"
                });

                var middleNameFld = form.addField({
                    id : "custpage_middle_name_fld",
                    type : serverWidget.FieldType.TEXT,
                    label : "Middle Name",
                    container : "empinfoid"
                });

                var lastNameFld = form.addField({
                    id : "custpage_last_name_fld",
                    type : serverWidget.FieldType.TEXT,
                    label : "Last Name",
                    container : "empinfoid"
                });

                var emailFld = form.addField({
                    id : "custpage_email_fld",
                    type : serverWidget.FieldType.EMAIL,
                    label : "Email",
                    container : "empinfoid"
                });

                var supervisorFld = form.addField({
                    id : "custpage_supervisor_fld",
                    type : serverWidget.FieldType.SELECT,
                    label : "Supervisor",
                    source: "employee",
                    container : "empinfoid"
                });

                var subsidiaryFld = form.addField({
                    id : "custpage_subsidiary_fld",
                    type : serverWidget.FieldType.SELECT,
                    label : "Subsidiary",
                    source : "subsidiary",
                    container : "empinfoid"
                });


                //Fields for meeting with supervisor field group
                var titleFld = form.addField({
                    id : "custpage_title_fld",
                    type : serverWidget.FieldType.TEXT,
                    label : "Title",
                    container : "custpage_grp_sup_meet"
                });

                var supMessageFld = form.addField({
                    id : "custpage_sup_message_fld",
                    type : serverWidget.FieldType.TEXTAREA,
                    label : "Message",
                    container : "custpage_grp_sup_meet"
                });


                //Fields for welcome email field group
                var subjectFld = form.addField({
                    id : "custpage_subject_fld",
                    type : serverWidget.FieldType.TEXT,
                    label : "Subject",
                    container : "custpage_grp_email_welcome"
                });

                var emailMessageFld = form.addField({
                    id : "custpage_email_message_fld",
                    type : serverWidget.FieldType.TEXTAREA,
                    label : "Message",
                    container : "custpage_grp_email_welcome"
                });

                form.addSubmitButton("Finish");

                firstNameFld.isMandatory = true;
                lastNameFld.isMandatory = true;
                supervisorFld.isMandatory = true;
                subsidiaryFld.isMandatory = true;
                titleFld.isMandatory = true;
                supMessageFld.isMandatory = true;
                subjectFld.isMandatory = true;
                emailMessageFld.isMandatory = true;

                emailFld.updateBreakType = FieldBreakType.STARTCOL;

                middleNameFld.updateDisplaySize({
                    height : 0,
                    width : 5
                });
                supMessageFld.updateDisplaySize({
                    height : 12,
                    width : 60
                });
                emailMessageFld.updateDisplaySize({
                    height : 12,
                    width : 60
                });

                titleFld.defaultValue = "Welcome meeting with your supervisor";
                supMessageFld.defaultValue = "Meet and greet with your supervisor and the team";
                subjectFld.defaultValue = "Welcome to SuiteDreams";
                emailMessageFld.defaultValue = "Hi, \n\n We'd like to welcome you to SuiteDreams. Please feel free to reach out if you have questions. \n\n\n Best regards, \n\n SuiteDreams HR";

                var checkbox = form.addField({
                    id : "custpage_submit_checkbox",
                    label : "Submitted",
                    type : serverWidget.FieldType.CHECKBOX
                });

                checkbox.updateDisplayType = FieldDisplayType.HIDDEN;

                response.writePage(form);
        }
        else {

            var firstName = request.parameters.custpage_first_name_fld;
            var middleInitial = request.parameters.custpage_middle_name_fld;
            var lastName = request.parameters.custpage_last_name_fld;
            var email = request.parameters.custpage_email_fld;
            var supervisor = request.parameters.custpage_supervisor_fld;
            var subsidiary = request.parameters.custpage_subsidiary_fld;

            var employee = record.create({
                type : record.Type.EMPLOYEE
            });

            employee.setValue("firstname", firstName);
            employee.setValue("middlename", middleInitial);
            employee.setValue("lastname", lastName);
            employee.setValue("email", email);
            employee.setValue("supervisor", supervisor);
            employee.setValue("subsidiary", subsidiary);

            var newEmployee = employee.save();

            var event = record.create({
                type : record.Type.EVENT
            });

            var title = request.parameters.custpage_title_fld;
            var supMessage = request.parameters.custpage_sup_message_fld;

            event.setValue("title", title);
            event.setValue("message", supMessage);
            event.setSublistValue({
                sublistId : "attendee",
                fieldId : "attendee",
                line: 1,
                value : newEmployee
            });
            event.setSublistValue({
                sublistId : "attendee",
                fieldId : "attendee",
                line: 2,
                value : supervisor
            });

            event.save();

            var subject = request.parameters.custpage_subject_fld;
            var emailMessage = request.parameters.custpage_email_message_fld;

            email.send({
                author : supervisor,
                recipients : email,
                subject : subject,
                body : emailMessage
            });

            var checkbox = request.parameters.custpage_submit_checkbox;

            checkbox.defaultValue = true;

        }
    }
    return {
        onRequest : onRequest
    }
})