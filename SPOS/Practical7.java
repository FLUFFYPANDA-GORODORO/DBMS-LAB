// Code for FIFO page replacement algorithm in java

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Queue;


class a
{
    @SuppressWarnings("unchecked")
    static int pageFaults(int incomingStream[], int n, int frames)
    {
        System.out.println("Incoming \t Pages");
        // Using Hashset to quickly check if a given
        // incoming stream item in set or not
        @SuppressWarnings("rawtypes")
        HashSet s = new HashSet<>(frames);

        // Queue created to store pages in FIFO manner
        // since set will not store order or entry
        // we will use queue to note order of entry of incoming page
        @SuppressWarnings("rawtypes")
        Queue queue = new LinkedList<>();

        int page_faults = 0;

        for (int i=0; i < n; i++)
        {
            // if set has lesser item than frames
            if (s.size() < frames)
            {
                // If incoming item is not present, add to set
                if (!s.contains(incomingStream[i]))
                {
                    s.add(incomingStream[i]);
                    page_faults++;

                    // Push the incoming page into the queue
                    queue.add(incomingStream[i]);


                }
            }

            // If the set is full then we need to do page replacement
            // in FIFO manner that is remove first item from both
            // set and queue then insert incoming page
            else
            {
                // If incoming item is not present
                if (!s.contains(incomingStream[i]))
                {
                    // remove the first page from the queue
                    int val = (int) queue.peek();

                    // remove from queue
                    queue.poll();

                    // Remove from set
                    s.remove(val);

                    // insert incoming page to set
                    s.add(incomingStream[i]);

                    // push incoming page to queue
                    queue.add(incomingStream[i]);
                    page_faults++;


                }
            }
            // printing happens here
            System.out.print(incomingStream[i] + "\t");
            System.out.print(queue + " \n");
        }


        return page_faults;
    }

    public static void main(String args[])
    {
        int incomingStream[] = {1, 0, 2, 6, 7 , 6, 2, 7, 0, 6, 2, 1, 5, 6,8};
        int frames = 4;

        int len = incomingStream.length;
        int pageFaults = pageFaults(incomingStream, len, frames);
        int hit = len - pageFaults;

      
        System.out.println("Page faults: " + pageFaults);
        System.out.println("Frame length " + len);
        System.out.println("Page fault Ratio: " + (double) pageFaults/len);
        System.out.println("Hits: " + hit);
        System.out.println("Hit Ratio : " + (double) hit/len);
    }

}

// OUTPUT


// 1       [1] 
// 0       [1, 0] 
// 2       [1, 0, 2] 
// 6       [1, 0, 2, 6] 
// 7       [0, 2, 6, 7] 
// 6       [0, 2, 6, 7] 
// 2       [0, 2, 6, 7] 
// 7       [0, 2, 6, 7] 
// 0       [0, 2, 6, 7] 
// 6       [0, 2, 6, 7] 
// 2       [0, 2, 6, 7] 
// 1       [2, 6, 7, 1] 
// 5       [6, 7, 1, 5] 
// 6       [6, 7, 1, 5] 
// 8       [7, 1, 5, 8] 
// Page faults: 8
// Page fault Ratio: 0.5333333333333333
// Hits: 7
// Hit Ratio : 0.4666666666666667


  










