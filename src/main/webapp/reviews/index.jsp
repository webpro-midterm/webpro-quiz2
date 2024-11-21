<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Review" %>
<div>
    <div class="text-4xl mb-4 text-center text-[#66FCF1] font-bold p-5 font-zen">
        <h1>REVIEWS</h1>
    </div>

    <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6 mx-5">
        <%
            List<Review> reviews = (List<Review>) request.getAttribute("reviews");
            if (reviews == null || reviews.isEmpty()) {
        %>
        <p class="text-white text-center col-span-full">No reviews available.</p>
        <%
        } else {
            for (Review review : reviews) {
        %>
        <div class="m-2">
            <div class="rounded-lg bg-[#2F4156] shadow-lg w-80 h-auto">
                <% if (review.getMovie().getImage() != null) { %>
                <img src="<%= review.getMovie().getImage() %>"
                     alt="<%= review.getMovie().getTitle() %> Image"
                     class="rounded-t-lg object-cover h-96 w-full">
                <% } else { %>
                <img src="https://via.placeholder.com/400x500"
                     alt="No Image"
                     class="rounded-t-lg object-cover h-64 w-full">
                <% } %>
                <div class="p-4 text-white">
                    <h2 class="mb-2 text-lg font-semibold"><%= review.getMovie().getTitle() %></h2>
                    <p class="mb-2 text-sm">Release Date: <%= review.getMovie().getReleaseDate() %></p>
                    <p class="mb-4 text-sm">
                        <%= review.getReview().length() > 100 ? review.getReview().substring(0, 100) + "..." : review.getReview() %>
                    </p>
                    <p class="mb-4 text-sm">Rating: <%= review.getRating() %>/5</p>
                    <a href="reviewDetails.jsp?id=<%= review.getId() %>"
                       class="block rounded-lg bg-blue-500 px-4 py-2 text-center font-semibold text-white hover:bg-blue-600">
                        Read More
                    </a>
                </div>
            </div>
        </div>
        <%
                }
            }
        %>
    </div>
</div>
