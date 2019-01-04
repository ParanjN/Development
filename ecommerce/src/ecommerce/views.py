from django.shortcuts import render
from django.http import HttpResponse

from .forms import ContactForm
def home_page(request):
    context = {
        "title" : "Hello World!",
         "content" : "Welcome to the Home page"
    }
    return render(request, "home_page.html", context)


def about_page(request):
    context = {
        "title" : "About Page",
        "content" : "Welcome to the About page"
    }
    return render(request, "home_page.html", context)

def contact_page(request):
    contactform = ContactForm(request.POST or None)
    context = {
        "title" : "Contact Page",
        "content" : "Welcome to the Contact page",
        "form" : contactform
    }

    if contactform.is_valid():
        print(contactform.cleaned_data)
    else:
        print("not valid")
    # if request.method == "POST":
    #     print(request.POST)
    #     print(request.POST.get('fullname'))
    #     print(request.POST.get('email'))
    #     print(request.POST.get('content'))
    return render(request, "contact/view.html", context)
