from django.shortcuts import render
from .forms import EmailForm
from .tasks import send_email_task

def send_email_view(request):
    confirmation_message = None

    if request.method == 'POST':
        form = EmailForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']

            # Call the Celery task to send the email asynchronously
            send_email_task.delay('Subject', 'Message', email)

            confirmation_message = f"An email will be sent to {email} shortly."
            form = EmailForm()
    else:
        form = EmailForm()

    return render(request, 'mailing/send_email.html', {'form': form, 'confirmation_message': confirmation_message})
