---
title: Moderation in Open Source
date: 2017-10-11T18:21:00+00:00
author: jsha
layout: post
---

Yesterday I attended the Maintainerati un-conference. It was neat! I joined a breakout session on moderation in open source communities, or keeping your community nice. Below are some of the things we talked about, plus a few of my own later thoughts. These focus largely on GitHub-centric communities.

## Start building a good culture early

There were two examples of big projects that had trouble with people being jerks, and attempts to fix it were stymied by disagreement on what to do, often from within the community of project leaders or admins. In one of the projects, frequently a moderator would remove a negative post, only to have their action undone by another moderator, escalating the conflict rather than healing it! It’s harder to turn a large ship than a small one.

## Delete early, delete often

Every moment a jerky post stays up, more people in your community see it. That slightly changes their perception of what is normal in your community. For some people that will push them towards more jerkiness; for others it will push them slowly away from your project.

Many maintainers (myself included) worry that people with moderated comments will cry censorship, but remember that your project’s issues and mailing lists are a community of purpose, and every unkind comment impairs that purpose. There are plenty of other venues on the Internet to debate philosophy; your issue tracker doesn’t need to be one of them. And remember that in most cases people whose comments are deleted never show up again.

Commenting on a thread saying “that comment was unacceptable” can be a useful tool for publicly setting standards of behavior, but keep it to a minimum; It can easily wind up escalating the conflict and derailing the original conversation. In most cases, a delete and a private follow-up message suffices.

## There are different kinds of bad actors

One project that was mentioned has a specific category for sockpuppet accounts; those with no activity other than a single unkind comment. These are easy to identify, and anyone with moderation privileges is encouraged to delete them on sight with no further process.

There are also brigades and drive-bys, when someone on another platform encourages lots of people to come to your project, generally to leave rude comments on one of your issues. A good strategy to deal with these: edit the top post to say [Moderator’s note: If you want this issue fixed, use the :thumbsup: emoji reaction on the first post. All “me too” and similar comments will be swiftly deleted]. The earlier you do this the better. You may also need to temporarily restrict commenting on the issue.

Then there are the persistent bad actors who are part of your community or an adjacent community. Consistent and frequent reminders of how to behave, combined with willingness to delete comments when necessary, may have an effect here, but there are often tricky issues about respect and clout and standing in a community (see above re: setting a good culture early).

## Discussing moderation produces more conflict than doing it

Nerds love nothing more than a good bikeshed, and every discussion of adopting a Code of Conduct has resulted in endless bikeshedding. Set a deadline for decisions on all major moderation-related changes (which should still be public). Also, provide some amount of private space for moderators to discuss pending enforcement decisions. Remember that on GitHub, trolls don’t get notified when their comment is deleted, so most of them will never even come back to raise a stink.

## Good tools are important

Tools really shape how you do moderation. For instance, I’m a huge fan of the Discourse forum software, because the authors put a lot of thought into good moderation. For instance, any community member can flag a post, and three flags hides a post. Admins can of course review and un-hide posts. Also, most moderation involves hiding a post behind a light gray link, which feels like an easier decision to make than deleting it outright. Also, the first time a post is hidden, the author is given the option to wait ten minutes, then edit it to automatically unhide it. This gives people an automatic second chance to try and improve their behavior.

GitHub could provide better moderation tools. I also highly recommend running a Discourse forum alongside your repos for more in-depth conversations, question-asking, and support.

## Write enforcement guidelines to go along with your codes of conduct

Enforcement is the hard part, and the larger your community (and the more moderators you have), the more specific you need to get.

Figure out who bears the brunt of bad behavior, and give them moderation privileges

On some projects, newbies receive more of the rude behavior, and it’s harder for them to take since they may feel like they don’t have enough social capital to deal with the trolls, especially if the trolls are more experienced or have more social capital than they do. Make sure the people who are most affected by harassment are directly empowered to do something about it.

## Don’t be afraid to delete comments criticizing yourself

This is one I struggle with a lot, since it feels like an abuse of power. Still, if participants in the community see people being abusive to project leaders and that behavior going unchecked, they can assume they’ll be on the receiving end eventually, and this can drive them away from the project. Criticism is fine and important, but you can demand that your critics treat you as kindly as they would a beloved colleague, or take their criticism somewhere other than your project’s issue tracker and mailing lists.

## Conclusion

In game design, they say “when you think you’ve made a level just hard enough, make it half as hard.” Level designers have a closeness to the game that makes it hard to see how difficult their levels are to real players. Similarly, project maintainers have a closeness to their project that makes it hard to see what it looks like to others. When you think you’ve made your community nice enough, make it twice as nice.
