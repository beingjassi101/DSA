# Write your MySQL query statement below
Select l.book_id, l.title, l.author, l.genre, l.publication_year,count(b.record_id) as current_borrowers from library_books l
left join borrowing_records b on l.book_id = b.book_id
where b.return_date is null
group by l.book_id, l.total_copies
having l.total_copies = count(b.record_id)
order by current_borrowers desc, l.title asc
