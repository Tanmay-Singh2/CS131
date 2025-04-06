#!/usr/bin/awk -f
# grader.awk - AWK script for Assignment 3
# Processes student grade data to do all 5 Tasks

BEGIN {
    FS = ",";  
    print "Assignment 3: AWK processing\n"
}

# Function to calculate average
function calculate_average(total, count) {
    return total / count;
}

{
    # Skip the header line
    if (NR == 1) {
        next;
    }

    id = $1;      
    name = $2;      

    total = 0;      

    # Sum all grade fields 
    for (i = 3; i <= NF; i++) {
        total += $i;
    }

    scores[name] = total;                          
    avg = calculate_average(total, NF - 2);        
    averages[name] = avg;                          

    # Determine pass or fail status 
    if (avg >= 70) {
        status[name] = "Pass";
    } else {
        status[name] = "Fail";
    }

    # Track the highest and lowest scorers
    if (NR == 2 || total > max_score) {
        max_score = total;
        top_student = name;
    }

    if (NR == 2 || total < min_score) {
        min_score = total;
        low_student = name;
    }
}

END {
    for (student in scores) {
        printf "Name: %s\n", student;
        printf "Total Score: %d\n", scores[student];
        printf "Average Score: %.2f\n", averages[student];
        printf "Status: %s\n\n", status[student];
    }

    print "-------------------------------"
    print "Top and Lowest Scoring Students\n"
    printf "Top Scorer: %s with %d points\n", top_student, max_score;
    printf "Lowest Scorer: %s with %d points\n", low_student, min_score;
}
